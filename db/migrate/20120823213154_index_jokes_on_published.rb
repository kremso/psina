class IndexJokesOnPublished < ActiveRecord::Migration
  def up
    add_index :jokes, :published
  end

  def down
    remove_index :jokes, :column => :published
  end
end
