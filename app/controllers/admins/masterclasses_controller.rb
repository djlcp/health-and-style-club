module Admins
  class MasterclassesController < ::Admins::NamespaceController
    before_action :set_masterclass, only: %i[edit update destroy]
    def index
      @masterclasses = Masterclass.all
    end

    def new
      @masterclass = Masterclass.new
    end

    def create
      @masterclass = Masterclass.new(masterclass_params)
      if @masterclass.save
        redirect_to admins_masterclasses_path, notice: 'Masterclass added.'
      else
        render :new
      end
    end

    def edit; end

    def update
      if @masterclass.update(masterclass_params)
        redirect_to admins_masterclasses_path, notice: 'Masterclass updated.'
      else
        render :edit
      end
    end

    def destroy
      @masterclass.destroy
      redirect_to admins_masterclasses_path, notice: 'The Masterclass was deleted.'
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

    def set_masterclass
      @masterclass = Masterclass.find(params[:id])
    end
  end
end