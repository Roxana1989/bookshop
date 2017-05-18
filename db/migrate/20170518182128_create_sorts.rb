class CreateSorts < ActiveRecord::Migration[5.0]
  def change
    create_table :sorts do |t|
      t.integer :position
      t.references :list, foreign_key: true
      t.references :book, foreign_key: true
      t.timestamp
    end
  end
end
