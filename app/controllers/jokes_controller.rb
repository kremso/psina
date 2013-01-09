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
      redirect_to action: :index, notice: "Joke submitted"
    else
      render :new
    end
  end

  def search
    @q = params[:q]
    @jokes = humor.find_jokes(@q)
  end
end
