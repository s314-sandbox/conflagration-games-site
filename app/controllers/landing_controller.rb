class LandingController < ApplicationController
  def index
    sorted_articles = Article.order(created_at: :desc)
    @news = sorted_articles.first(3)
  end
end
