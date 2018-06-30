module Members
  class MembersClubController < ::Members::NamespaceController
    def workout; end

    def personal_styling
      @collections = Collection.personal_styling
    end

    def personal_development; end

    def recipes; end

    def member_orientation; end
  end
end