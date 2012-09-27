# encoding: utf-8

class Admin::JokesController < ApplicationController
  before_filter :authenticate

  def index
    @unpublished_jokes = humor.unpublished_jokes
  end

  def publish
    if humor.publish_joke(params[:id], params[:joke])
      redirect_to admin_jokes_path
    else
      render :index, error: 'Vtip sa nepodarilo publikovať'
    end
  end

  private

  def authenticate
    authenticate_or_request_with_http_basic do |user, password|
      user == "admin" && password == "psina2012"
    end
  end
end
