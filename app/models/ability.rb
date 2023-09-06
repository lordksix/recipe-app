class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new

    # can :destroy, Recipe, user: user
    can %i[index show], User
    can %i[index new update destroy], Food, { user_id: user.id }
    can %i[index destroy], Recipe, { user_id: user.id }
  end
end
