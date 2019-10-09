class RecipesController < ApiController
  def create
    result = CreateRecipe.new(Recipe).call(recipe_params[:item_id], recipe_params[:recipe_type_id], recipe_params[:ingredients])

    if result.errors.empty?
        response = { data: result, status: :created }
    else
        response = { data: result.errors, status: :bad_request }
    end

    respond_to do |format|
        format.json { render json: response[:data], status: response[:status] }
    end
  end

  def recipe_params
      params.permit(:item_id, :recipe_type_id, { ingredients: [ :item_id, :quantity ] })
  end
end
