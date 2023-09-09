class PublicRecipesController < ApplicationController
  def index
    @public_recipe = Recipe.includes(:user).where(public: true).order('created_at DESC')
  end
end
