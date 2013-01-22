# encoding: utf-8
class JokesController < ApplicationController
  def index
    @jokes = humor.published_jokes
  end

  def new
    @joke = humor.new_joke
  end

  def create
    @joke = humor.new_joke(params[:joke])

    unless params[:force]
      @similar_jokes = humor.similar_jokes(@joke)
      render :new and return if @similar_jokes.any?
    end

    if @joke.submit
      redirect_to jokes_path, notice: "Vtip bol odoslaný. V zozname vtipov sa bude zobrazovať až po schválení"
    else
      render :new
    end
  end

  def search
    @q = params[:q]
    redirect_to jokes_path if @q.blank?
    @jokes = humor.find_jokes(@q)
  end
end
