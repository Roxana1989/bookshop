class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.timestamp
    end
  end
end
