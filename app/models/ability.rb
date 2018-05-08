class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.permision == "admin"
      can :manage, :all
    elsif user.permision == "manager"
      can [:read, :update], [Category, Book, Author, Publisher, RequestBook]
      cannot [:update, :create, :destroy], User
      can [:read, :update], User,  id: user.id
      comment_permission user
    else
      can [:read, :update], User,  id: user.id
      comment_permission user
    end
  end

  def comment_permission user
    can :create, Review
    can :update, Review, user_id: user.id
    can :destroy, Review, user_id: user.id
  end
end
