class ItemsController < ApiController
    def index
        item_list = ListItem.new.execute

        render :json => item_list
    end

    def create
        result = CreateItem.new(Item).call(item_params)

        if result.errors.empty?
            response = { data: result, status: :created }
        else
            response = { data: result.errors, status: :bad_request }
        end

        respond_to do |format|
            format.json { render json: response[:data], status: response[:status] }
        end
    end

    def item_params
        params.permit(:name)
    end
end
