class CreateJokes < ActiveRecord::Migration
  def change
    create_table :jokes do |t|
      t.text :body, nil: false
      t.boolean :published, default: false
      t.timestamps
    end
  end
end
