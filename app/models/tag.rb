class Tag < ActiveRecord::Base
  has_and_belongs_to_many :jokes

  def self.labeled(label)
    where(label: label)
  end
end
