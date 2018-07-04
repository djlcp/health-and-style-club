module Members
  class MembersClubController < ::Members::NamespaceController
    def workout; end

    def personal_styling
      @collections = Collection.personal_styling
    end

    def personal_development
      @collections = Collection.personal_development
    end

    def recipes
      @meal_plans = Post.mealplan
      @breakfast = Post.breakfast
      @lunch = Post.lunch
      @dinner = Post.dinner
      @snack = Post.snack
      @desert = Post.desert
    end

    def member_orientation; end
  end
end