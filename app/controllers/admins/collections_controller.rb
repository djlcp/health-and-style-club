module Admins
  class CollectionsController < Admins::NamespaceController
    before_action :set_collection, only: [:edit, :update]
    def index; end

    def new
      @collection = Collection.new
    end

    def create
      @collection = Collection.new(collection_params.merge(user: current_user))
      if @collection.save
        redirect_to admins_collections_path
      else
        render :new
      end
    end

    def edit; end

    def update
      if @collection.update(collection_params)
        redirect_to admins_collections_path
      else
        render :edit
      end
    end

    private

    def collection_params
      params.require(:collection).permit(
        :name,
        :collection_type,
        collections_posts_attributes: %i[id post_id position _destroy]
      )
    end

    def set_collection
      @collection = Collection.find(params[:id])
    end
  end
end