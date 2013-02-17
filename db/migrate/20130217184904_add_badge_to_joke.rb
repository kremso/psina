class AddBadgeToJoke < ActiveRecord::Migration
  def change
    add_column :jokes, :badge, :boolean, default: false, null: false
  end
end
