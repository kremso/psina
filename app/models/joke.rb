class Joke < ActiveRecord::Base
  attr_accessible :body, :tags

  has_and_belongs_to_many :tags

  def tags=(new_tags)
    super(new_tags.split(',').collect { |tag| ::Tag.new(label: tag) })
  end

  def tags
    TagList.new(super)
  end

  def submit
    save
  end

  def self.published
    where(published: true)
  end
end
