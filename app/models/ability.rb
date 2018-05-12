class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new
    if user && user.role  == "admin"
      can :manage, :all
    end
    if user && user.role == "contributor"
      can :manage, Post
    end
    if user && user.role == "subscriber"
      can :read, :all
      cannot :edit, Post
    end
    if user
      can :read, Post
    end
  end
end
