class TagList
  def initialize(tags)
    @tags = tags
  end

  def to_s
    @tags.collect(&:label).join(', ')
  end

  def each(&block)
    @tags.each(&block)
  end
end
