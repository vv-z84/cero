class CreateItem
    def initialize(item)
        @item = item
    end

    def execute()
        @item.save
    end
end