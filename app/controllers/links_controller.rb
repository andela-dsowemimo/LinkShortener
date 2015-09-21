require 'securerandom'
require 'browser'

class LinksController < ApplicationController

  def index
    @link = Link.new
    @links = (Link.all.most_recent).page(params[:page]).per(10)
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
        format.js {}
        format.html {}
      end
    else
      flash[:danger] = "Please provide a valid URL"
    end
  end

  def show
    @link = Link.find(params[:id])
    @top_users = @link.sort_users(@link.statistic.users)
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
    when 1 then @links = (Link.all.most_recent).page(params[:page]).per(10)
    when 2 then @links = (Link.all.most_popular).page(params[:page]).per(10)
    end
    respond_to do |format|
      format.js {}
    end
  end

  def destroy
    Link.find(params[:id]).destroy
    redirect_to current_user
  end

  private
  def link_params
    params.require(:link).permit(:full_link_address)
  end
end
