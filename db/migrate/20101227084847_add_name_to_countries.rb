class AddNameToCountries < ActiveRecord::Migration
  def self.up
    add_column :countries, :name, :string
  end

  def self.down
    remove_column :countries, :name
  end
end
