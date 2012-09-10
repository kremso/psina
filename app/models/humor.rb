class Humor
  attr_writer :joke_maker

  def new_joke(*args)
    joke_maker.call(*args)
  end

  def published_jokes
    Joke.published
  end

  def find_jokes(q)
    Joke.search(q) + Tag.jokes_tagged_with(q)
  end

  private

  def joke_maker
    @joke_maker || Joke.public_method(:new)
  end
end
