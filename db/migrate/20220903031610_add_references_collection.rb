class AddReferencesCollection < ActiveRecord::Migration[7.0]
  def change
    add_reference :collections, :user, null: false, foreign_key: true
    add_reference :collections, :restaurant, null: false, foreign_key: true
  end
end
