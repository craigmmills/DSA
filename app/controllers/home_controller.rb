class HomeController < ApplicationController
  def index
    # needed params: @hotel, @cash, @total, @nights, @dsa_id, @advanced_dsa
    
    if params[:id].blank?
      @dsa_id = 43
    else
      @dsa_id = params[:id].first
    end
        
    if params[:nights].blank?
      @nights = 1
    else
      @nights = params[:nights]    
    end
    
    
    #get the correct dsa record
    @dsa_rec = DsaDetail.find(@dsa_id)
    
    
    @hotel = (@dsa_rec.total * (@dsa_rec.perc_hotel/100)).round(2)
    @cash = (@dsa_rec.total - @hotel).round(2)
    @total = (@dsa_rec.total * @nights.to_f).round(2)
    @advanced_dsa = (@total * 0.9).round(2)
    
   
    @deltek_text = "travelling for #{@nights} days @ $#{@dsa_rec.total} per day - advanced dsa (90%) = $#{@advanced_dsa}"
  end

#in here I will test the two parameters, number of nights and dsa_details ID
#if not there I will set as default to 1 night in London or somit, I can then set all the params for the form...


  
  
end
