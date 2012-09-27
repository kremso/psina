require 'texticle/searchable'

class Joke < ActiveRecord::Base
  extend Searchable(:title, :body, :advice)

  attr_accessible :body, :tags, :title, :advice, :author, :email

  has_and_belongs_to_many :tags

  validates_presence_of :title, :body, :advice, :author, :email

  def tags=(new_tags)
    super(new_tags.split(',').collect { |tag| ::Tag.find_or_initialize_by_label(tag.strip) })
  end

  def tags
    TagList.new(super)
  end

  def submit
    save
  end

  def publish(params)
    self[:published] = true
    self[:rating] = params[:rating]
    self[:comment] = params[:comment]
    save
  end

  def self.search_published(q)
    published.search(q)
  end

  def self.published_and_tagged_with(tag)
    ::Tag.labeled(tag).includes(:jokes).references(:jokes).merge(Joke.published).collect(&:jokes).flatten
  end

  def self.published
    where(published: true)
  end

  def self.unpublished
    where(published: false)
  end
end
