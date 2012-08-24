class Humor
  attr_writer :joke_maker

  def new_joke(*args)
    joke_maker.call(*args)
  end

  def published_jokes
    Joke.published
  end

  private

  def joke_maker
    @joke_maker || Joke.public_method(:new)
  end
end
