class JokesController < ApplicationController
  def new
    @joke = Joke.new
  end

  def create
    joke = Humor.new(params[:body])
    joke.tag_with(params[:tags])
    joke.submit!

    render nothing: true
  end
end
