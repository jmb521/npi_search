class ProvidersController < ApplicationController

    def index
        if params[:number] && params[:number].to_i != 0
            p = Provider.find_by(npi: params[:number])
            if !p
                created_provider = Provider.get_provider(params[:number])
                if !created_provider
                    @error = "Provider not located"
                end
            end
        elsif params[:number] == " "
            @error = "Please enter a number"
        end
        @providers = Provider.all.order_by_created_at
    end
end
