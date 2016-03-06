class SitesController < ApplicationController
  before_action :authenticate_user, :only => [:create, :update, :destroy]
  USERS = { "jgisin" => "jeff0708" }

  def index
    @sites = Site.all
  end

  def show
    @site = Site.find(params[:id])
    @sites = Site.all.limit(3)
  end

  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)
    if @site.save
      redirect_to sites_path
    else
      redirect_to new_site_path
    end
  end

  def edit
    @site = Site.find(params[:id])
  end

  def update
    @site = Site.find(params[:id])
    if @site.update(site_params)
      redirect_to sites_path
    else
      redirect_to edit_site_path(@site)
    end
  end

  def destroy
    @site = Site.find(params[:id])
    if @site.destroy
      redirect_to sites_path
    else
      redirect_to request.referrer
    end
  end

  private

  def site_params
    params.require(:site).permit(:title, :subheading, :description, :url,  :url_image)
  end

  private
  # The HTTP Digest version (better)
  def authenticate_user
    authenticate_or_request_with_http_digest do |username|
      USERS[username]
    end
  end
end
