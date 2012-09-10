class Tag < ActiveRecord::Base
  attr_accessible :label

  has_and_belongs_to_many :jokes

  scope :labeled, lambda { |label| where(label: label) }

  def self.jokes_tagged_with(tag)
    labeled(tag).includes(:jokes).collect(&:jokes).flatten
  end
end
