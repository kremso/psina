class JokeExhibit < Exhibit
  def self.applicable_to?(object)
    object_is_any_of?(object, 'Joke')
  end

  def tags
    exhibit(super)
  end
end
