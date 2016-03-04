class StaticPagesController < ApplicationController

  def index
    @posts = MediumScraper.new
    @num_posts = 2#@posts.num_posts
  end
end
