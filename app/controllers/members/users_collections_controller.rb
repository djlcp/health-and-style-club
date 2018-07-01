module Members
  class UsersCollectionsController < ::Members::NamespaceController
    before_action :set_users_collection
    def update
      @users_collection.update(users_collection_params)
      if users_collection_params[:complete]
        redirect_to members_root_path
      else
        redirect_to(
          members_collection_path(@users_collection.collection_id,
          stage: @users_collection.stage)
        )
      end
    end

    private

    def users_collection_params
      params.require(:users_collection).permit(:stage, :complete)
    end

    def set_users_collection
      @users_collection = UsersCollection.find(params[:id])
    end
  end
end