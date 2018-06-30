module Members
  class CollectionsController < ::Members::NamespaceController
    before_action :set_collection
    def show; end

    private

    def set_collection
      @collection = Collection.find(params[:id])
    end
  end
end