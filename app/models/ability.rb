class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role  == "admin"
      can :manage, :all
    end
    if user.role == "contributor"
      can :manage, :post
    end
    if user.role == "subscriber"
      can :read, :all
    end
  end
end
