# encoding: utf-8

class Admin::JokesController < ApplicationController
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
end
