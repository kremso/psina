class TagList
  def initialize(tags)
    @tags = tags
  end

  def to_s
    @tags.collect(&:label).join(', ')
  end
end
