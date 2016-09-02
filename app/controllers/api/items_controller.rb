class Api::ItemsController < ApiController
  before_action :authenticated?

  def create
    list = List.find(params[:list_id])
    item = list.items.new(item_params)

    if item.save
      render json: item
    else
      rendor json: { errors: user.errors.full_messages }, status: :unprocessable_entity #:HTTP Basic: Access denied.
    end
  end

  private

  def item_params
    params.require(:item).permit(:description)
  end
end
