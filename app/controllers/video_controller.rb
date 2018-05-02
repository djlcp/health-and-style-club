class VideoController < ApplicationController
  def create
    @video = video.new(params.require(:video).permit(:title, :link))

    respond_to do |format|
        if @video.save
          format.html { redirect_to masterclass_path(@masterclass), notice: 'Masterclass added.'}
        else
          format.html { render :new}
          end
        end
      end

      def edit
        @video = video.find(params[:id])

      end

      def update
        @video = video.find(params[:id])
        respond_to do |format|
          if @masterclass.update(params.require(:post).permit(:title, :text))
            format.html { redirect_to @masterclass, notice: 'Masterclass updated.' }
          else
            format.html { render :edit }

          end
        end
      end


end
