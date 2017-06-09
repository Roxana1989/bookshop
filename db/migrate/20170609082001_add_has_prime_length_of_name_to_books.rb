class AddHasPrimeLengthOfNameToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :has_prime_length_of_name, :boolean
  end
end
