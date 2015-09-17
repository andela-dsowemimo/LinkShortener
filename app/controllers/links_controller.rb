require 'securerandom'
require 'browser'

class LinksController < ApplicationController

  def index
    @link = Link.new
    @links = (Link.all.most_recent).page(params[:page]).per(5)
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def create
    @link = Link.new(link_params)
    @link.shortened_link_address = SecureRandom.urlsafe_base64(8)
    if @link.save
      current_user.links << @link  if logged_in?
      respond_to do |format|
        format.html {}
        format.js {}
      end
    end
  end

  def show
    @link = Link.find(params[:id])
  end

  def visit_webpage
    @link = Link.find_by(shortened_link_address: params[:shortened_link_address])
    @link.increment_visits
    @link.get_browser_count(browser.name)
    logged_in? ? @link.get_user_count(current_user.name) : @link.get_user_count("Anonymous Users") 
    redirect_to @link.full_link_address
  end

  def sort_links
    case params[:value].to_i
      when 1 then @links = (Link.all.most_recent).page(params[:page]).per(5)
      when 2 then @links = (Link.all.most_popular).page(params[:page]).per(5)
    end
    respond_to do |format|
      format.js {}
    end
  end

  private
  def link_params
    params.require(:link).permit(:full_link_address)
  end
end
