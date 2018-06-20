class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show;
    @comments = @post.comments.all
    @comment = @post.comments.build
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path, notice: 'Post added.'
    else
      render :new
    end
  end

  def edit; end

  def update
    # @post.assign_attributes(post_params)
    # @post.valid?
    # @post.errors.full_messages
    # @post.inspect
    # byebug

    if @post.update(post_params)
      redirect_to @post, notice: 'Post updated.'
    else
      #render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: 'Your post was deleted.'
  end

  private

  def post_params
    params.require(:post).permit(:title, :body_text, :image, :post, :post_description)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
