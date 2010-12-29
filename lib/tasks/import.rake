require 'CSV'

namespace :import do
  
  task :all => :environment do
  
    Rake::Task['import:fill_countries'].invoke
    Rake::Task['import:fill_currency'].invoke
    Rake::Task['import:fill_dsa'].invoke
    
  end
  
  
  #fill the main dsa details table from the fake csv - TODO: will need to add something to scrape the real data
  task :fill_dsa => :environment do
    
    DsaDetail.delete_all
    file = "dsa"
    path = "#{RAILS_ROOT}/lib/data/#{file}.csv"    
    puts "fill dsa details"
                  
    CSV.foreach(path, :headers => true) do |row|
      puts row.to_s
      DsaDetail.create  :city => row['area'],
                          :country_id => Country.find(:first, :conditions => ["name = ?", row["country"]]).id,
                          :currency_id => 1,
                          :total => row['total'],
                          :perc_hotel => row['hotel_perc']
      
    end    
  end
  
  task :fill_countries => :environment do
    file = "dsa"
    path = "#{RAILS_ROOT}/lib/data/#{file}.csv"    
    puts "fill countries"
    
    Country.delete_all
    #get unique set of countries from csv and add them to the db
    CSV.foreach(path, :headers => true) do |row|
        puts row["name"]
        Country.create :name => row["country"] unless Country.find(:first, :conditions => ["name = ?", row["country"]])     
    end    
  end
  
  task :fill_currency => :environment do
    
    puts "fill currency"
      Currency.delete_all         
      Currency.create :name => "Euro",
                      :exchange_rate => 0.54
                      
      Currency.create :name => "US Dollars",
                      :exchange_rate => 0.54
                      
  end
end