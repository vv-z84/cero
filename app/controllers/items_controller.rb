class ItemsController < ApplicationController
    def index
        item_list = ListItem.new.execute
        
        render :json => item_list
    end

    def create
        CreteItem.new(params).execute
    end
end
