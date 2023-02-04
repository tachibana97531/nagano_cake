class SearchesController < ApplicationController
    before_action :authenticate_customer!
    
    def search
      @range = params[:range]
end
