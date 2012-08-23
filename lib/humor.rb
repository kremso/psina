class Humor
  def initialize(body)
    @joke = Joke.new(body: body)
  end

  def tag_with(tags)
    tags.split(",").each do |tag|
      @joke.add_tag(tag.strip)
    end
  end

  def submit!
    @joke.save!
  end
end
