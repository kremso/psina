class ChangeVarcharColumnsToText < ActiveRecord::Migration
  def change
    change_column :jokes, :title, :text, null: false
    change_column :jokes, :author, :text, null: false
    change_column :jokes, :email, :text, null: false
    change_column :jokes, :comment, :text
    change_column :tags, :label, :text
  end
end
