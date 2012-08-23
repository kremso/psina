class Joke < ActiveRecord::Base
  attr_accessible :body

  has_and_belongs_to_many :tags

  def add_tag(tag)
    tags << ::Tag.new(label: tag)
  end
end
