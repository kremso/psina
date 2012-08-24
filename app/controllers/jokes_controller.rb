class JokesController < ApplicationController
  def index
    @jokes = humor.published_jokes
  end

  def new
    @joke = humor.new_joke
  end

  def create
    @joke = humor.new_joke(params[:joke])
    if @joke.submit
      redirect_to action: :index, notice: "Joke submitted"
    else
      render :new
    end
  end
end
