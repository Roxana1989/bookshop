class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.boolean :available
      t.references :publisher, foreign_key: true
      t.timestamp
    end
  end
end
