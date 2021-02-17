class RecipesController < ApplicationController
  def index
    @recipes = content_loader.recipes
  end

  def show
    @recipe = content_loader.entry params[:id]
  end

  private

  def content_loader
    @content_loader ||= Content::Loader.new
  end
end
