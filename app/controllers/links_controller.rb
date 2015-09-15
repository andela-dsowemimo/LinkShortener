require 'securerandom'

class LinksController < ApplicationController
  def index
    @link = Link.new
    @links = Link.all.recent_sort
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
    redirect_to @link.full_link_address
  end

  private
  def link_params
    params.require(:link).permit(:full_link_address)
  end
end
