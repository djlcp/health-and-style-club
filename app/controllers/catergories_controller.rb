class CategoriesController < ApplicationController

  def index
  end

  def show
  end

  def new
    @categories = Category.new
  end

  def edit
  end


  def create
  end


  def update
  end


  def destroy
  end

  private

    #
    def comment_params
      params.require(:category).permit(:category_id, :name, :created_at, :updated_at)
    end
end
