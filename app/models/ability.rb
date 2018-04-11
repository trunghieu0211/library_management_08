class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.permision == "admin"
      can :manage, :all
    elsif user.permision == "manager"
      can [:read, :update], :all
      cannot [:update, :create, :destroy], User
    else
      comment_permission user
    end
  end

  def comment_permission user
    can :create, Review
    can :update, Review, user_id: user.id
    can :destroy, Review, user_id: user.id
  end
end
