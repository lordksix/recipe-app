class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new

    can :read, :all
    can :manage, Food, { user_id: user.id }
    can :manage, Recipe, { user_id: user.id }
  end
end
