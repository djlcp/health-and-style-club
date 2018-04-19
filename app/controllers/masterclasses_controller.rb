class MasterclassesController < ApplicationController

  def index
    @masterclasses = Masterclass.all
  end

  def show
    @masterclass = Masterclass.find(params[:id])
  end

  def new
    @masterclass = Masterclass.new
  end

  def create
    @masterclass = Masterclass.new(params.require(:masterclass).permit(:title, :text))

    respond_to do |format|
        if @masterclass.save
          format.html { redirect_to masterclass_path(@masterclass), notice: 'Masterclass added.'}
        else
          format.html { render :new}
          end
        end
      end

      def edit
        @masterclass = masterclass.find(params[:id])

      end

      def update
        @masterclass = masterclass.find(params[:id])
        respond_to do |format|
          if @masterclass.update(params.require(:post).permit(:title, :text))
            format.html { redirect_to @masterclass, notice: 'Masterclass updated.' }
          else
            format.html { render :edit }

          end
        end
      end



      def destroy
        @masterclass = Masterclass.find(params[:id])
        @masterclass.destroy
        respond_to do |format|
          format.html { redirect_to masterclass_path, notice: 'The Masterclass was deleted.' }
          format.json { head :no_content }

      end
      end

    private

    def post_params
      params.require(:post).permit(:title, :text)
    end

    def set_link
        @masterclass = Masterclass.find(params[:id])
    end



    end
