require 'securerandom'

class LinksController < ApplicationController
  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.shortened_link_address = SecureRandom.urlsafe_base64(20)
  end

  private
  def link_params
    params.require(:link).permit(:full_link_address)
  end
end
