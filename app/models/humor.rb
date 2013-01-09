class Humor
  attr_writer :joke_maker

  def new_joke(*args)
    joke_maker.call(*args)
  end

  def published_jokes
    Joke.published.order("id desc")
  end

  def find_jokes(q)
    Joke.search_published(q) + Joke.published_and_tagged_with(q)
  end

  def publish_joke(id, params)
    joke = Joke.find(id)
    joke.publish(params)
  end

  def unpublished_jokes
    Joke.unpublished || []
  end

  def destroy_joke(id)
    Joke.find(id).destroy
  end

  def similar_jokes(joke)
    Joke.find_similar(joke.body)
  end

  private

  def joke_maker
    @joke_maker || Joke.public_method(:new)
  end
end
