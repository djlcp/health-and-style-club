module Contributors
  class MasterclassesController < ::Contributors::NamespaceController
    def index
      @masterclasses = Masterclass.where(user_id: current_user)
    end

    def show
      @masterclass = Masterclass.find(params[:id])
      respond_to do |format|
        format.html { render :show }
        format.json do
          render json: @masterclass.as_json.merge(
            expert_name: @masterclass.user.full_name,
            expert_image_path: @masterclass.user.bioavatar.avatar_url,
            path: Rails.application.routes.url_helpers.members_masterclass_path(@masterclass),
            image_path: @masterclass.preview_url
          )
        end
      end
    end

    def new
      @masterclass = Masterclass.new
    end

    def create
      @masterclass = Masterclass.new(masterclass_params)

      respond_to do |format|
        if @masterclass.save
          format.html { redirect_to masterclass_path(@masterclass), notice: 'Masterclass added.'}
        else
          format.html { render :new}
        end
      end
    end

    def edit
      @masterclass = Masterclass.find(params[:id])
    end

    def update
      @masterclass = Masterclass.find(params[:id])
      respond_to do |format|
        if @masterclass.update(masterclass_params)
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

    def masterclass_params
      params.require(:masterclass).permit(
        :preview,
        :title,
        :text,
        :user_id,
        videos_attributes: [:id, :title, :link,:welcome_video, :position, :_destroy],
        events_attributes: [:id, :title, :link, :_destroy],
        documents_attributes: [:id, :title, :link, :_destroy]
      )
    end

    def set_link
      @masterclass = Masterclass.find(params[:id])
    end
  end
end