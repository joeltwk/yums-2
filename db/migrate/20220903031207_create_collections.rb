class CreateCollections < ActiveRecord::Migration[7.0]
  def change
    create_table :collections do |t|

      t.timestamps
    end
  end
end
