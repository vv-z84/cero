class CreateUser
    def initialize(model)
        @model = model
    end

    def call(user)
        @model.create(user)
    end
end