class CreateItem
    def initialize(item_model)
        @item_model = item_model
    end

    def call(item)
        @item_model.create(item)
    end
end