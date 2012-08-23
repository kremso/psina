class CreateJokesTags < ActiveRecord::Migration
  def up
    create_table :jokes_tags do |t|
      t.references :joke
      t.references :tag
    end
    add_foreign_key :jokes_tags, :jokes
    add_foreign_key :jokes_tags, :tags

    add_index :jokes_tags, [:joke_id, :tag_id]
  end

  def down
    drop_table :jokes_tags
  end
end
