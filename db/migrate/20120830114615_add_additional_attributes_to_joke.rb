class AddAdditionalAttributesToJoke < ActiveRecord::Migration
  def change
    add_column :jokes, :title, :string, limit: 100, null: false
    add_column :jokes, :advice, :text
    add_column :jokes, :author, :string, limit: 100, null: false
    add_column :jokes, :email, :string, limit: 100, null: false
  end
end
