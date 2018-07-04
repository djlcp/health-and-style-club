module Admins
  class PostsController < Admins::NamespaceController
    before_action :set_post, only: [:edit, :update, :destroy]
    def index
      @posts = Post.all
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params)
      if @post.save
        redirect_to admins_posts_path, notice: 'Post added.'
      else
        render :new
      end
    end

    def edit; end

    def update
      if @post.update(post_params)
        redirect_to admins_posts_path, notice: 'Post updated.'
      else
        render :edit
      end
    end

    def destroy
      @post.destroy
      redirect_to admins_posts_path, notice: 'Your post was deleted.'
    end

    private

    def post_params
      params.require(:post).permit(
        :title,
        :body_text,
        :image,
        :post,
        :post_description,
        :user_id,
        :category,
        :paid_for
      )
    end

    def set_post
      @post = Post.find(params[:id])
    end
  end
end