class AddNameToCurrencies < ActiveRecord::Migration
  def self.up
    add_column :currencies, :name, :string
    add_column :currencies, :exchange_rate, :float
  end

  def self.down
    remove_column :currencies, :exchange_rate
    remove_column :currencies, :name
  end
end
