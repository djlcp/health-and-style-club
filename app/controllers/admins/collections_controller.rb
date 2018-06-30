module Admins
  class CollectionsController < Admins::NamespaceController
    before_action :set_collection
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

    def update; end

    private

    def collection_params
      params.require(:collection).permit(
        :name,
        :collection_type,
        collections_posts_attributes: %i[post_id position _destroy]
      )
    end

    def set_collection
      @collection = Collection.find(params[:id])
    end
  end
end