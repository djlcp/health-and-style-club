class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create

    @post = current_user.posts.new(post_params)

    respond_to do |format|
    if @post.save
      format.html { redirect_to posts_path, notice: 'Post added.'}
    else
      format.html { render :new}
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update(params.require(:post).permit(:title, :body_text))
        format.html { redirect_to @post, notice: 'Post updated.' }
      else
        format.html { render :edit }
      end
    end
  end



  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path, notice: 'Your post was deleted.' }
      format.json { head :no_content }
    end
  end

private

def post_params
  params.require(:post).permit(:title, :body_text, :image)
end

def set_link
  @post = Post.find(params[:id])
end



end
