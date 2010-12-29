class AddTotalToDsaDetail < ActiveRecord::Migration
  def self.up
    add_column :dsa_details, :total, :float
  end

  def self.down
    remove_column :dsa_details, :total
  end
end
