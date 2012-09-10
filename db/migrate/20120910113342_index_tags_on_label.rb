class IndexTagsOnLabel < ActiveRecord::Migration
  def up
    add_index :tags, :label, unique: true
  end

  def down
    remove_index :tags, :label
  end
end
