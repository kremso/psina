class AddAdminAttributesToJokes < ActiveRecord::Migration
  def change
    add_column :jokes, :rating, :integer
    add_column :jokes, :comment, :string, limit: 200
  end
end
