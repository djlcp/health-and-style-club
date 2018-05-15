class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      if user.role  == "admin"
        can :manage, :all
      end
      if user.role == "contributor"
        can :manage, Post
      end
      if user.role == "subscriber"
        can :read, :all
        cannot :edit, Post
      end
    else
      can :read, :all
      cannot :edit, Post
    end
  end
end
