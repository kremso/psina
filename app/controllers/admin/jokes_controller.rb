# encoding: utf-8

class Admin::JokesController < ApplicationController
  before_filter :authenticate

  def index
    @unpublished_jokes = humor.unpublished_jokes
    @published_jokes = humor.published_jokes
  end

  def publish
    if humor.publish_joke(params[:id], params[:joke])
      redirect_to admin_jokes_path, notice: 'Vtip bol publikovaný'
    else
      redirect_to admin_jokes_path, alert: 'Vtip sa nepodarilo publikovať'
    end
  end

  def unpublish
    if humor.unpublish_joke(params[:id])
      redirect_to admin_jokes_path, notice: 'Vtip bol odpublikovaný'
    else
      redirect_to admin_jokes_path, alert: 'Vtip sa nepodarilo odpublikovať'
    end
  end

  def destroy
    if humor.destroy_joke(params[:id])
      redirect_to admin_jokes_path, notice: 'Vtip bol zmazaný'
    else
      redirect_to admin_jokes_path, notice: 'Vtip sa nepodarilo zmazať'
    end
  end

  private

  def authenticate
    authenticate_or_request_with_http_basic do |user, password|
      user == "admin" && password == "psina2012"
    end
  end
end
