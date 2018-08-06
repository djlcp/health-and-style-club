module Contributors
  class CollectionsController < ::Contributors::NamespaceController
    before_action :set_collection
    before_action :set_users_collection
    before_action :set_stage
    def show; end

    private

    def set_collection
      @collection = Collection.find(params[:id])
    end

    def set_stage
      @stage = params[:stage] ? params[:stage].to_i : @users_collection.stage
    end

    def set_users_collection
      @users_collection =
        UsersCollection.find_or_create_by(collection_id: @collection.id, user_id: current_user.id) do |uc|
          uc.user = current_user
          uc.collection = @collection
          uc.stage = 1
        end
    end
  end
end