require 'texticle/searchable'

class Joke < ActiveRecord::Base
  extend Searchable(:title, :body, :advice)

  attr_accessible :body, :tags, :title, :advice, :author, :email

  has_and_belongs_to_many :tags

  validates_presence_of :title, :body, :advice, :author, :email

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
