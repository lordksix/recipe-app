class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new

    can %i[index show], User
    can [:new], Food
    can %i[index update destroy], Food, { user_id: user.id }
  end
end
