require 'securerandom'

class LinksController < ApplicationController
  def index
    @link = Link.new
    @links = Link.all.recent_sort
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.shortened_link_address = SecureRandom.urlsafe_base64(8)
    if @link.save
      respond_to do |format|
        format.html {}
        format.js {}
      end
    end
  end

  def show

  end

  def visit_webpage
    require 'pry'; binding.pry
    @link = Link.find_by(shortened_link_address: params[:shortened_link_address])
    @link.views +=1
    redirect_to @link.full_link_address
  end

  private
  def link_params
    params.require(:link).permit(:full_link_address)
  end
end
