class CreateDsaDetails < ActiveRecord::Migration
  def self.up
      create_table :dsa_details do |t|
        t.column :city, :text
        t.column :country_id, :integer
        t.column :currency_id, :integer
        t.column :perc_hotel, :float
      end
    end

    def self.down
      drop_table :dsaDetails
    end
  
end
