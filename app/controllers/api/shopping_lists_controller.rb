class Api::ShoppingListsController < ApplicationController
  
    def index
        # Implement code to fetch and return a list of users
        shopping_list = ShoppingList.where(user_id: params[:user_id])
        if shopping_list
          render json: shopping_list
        else
          render json: { errors: shopping_list.errors }, status: :unprocessable_entity
        end 
      end

      def show
        # Implement code to fetch and return a specific user
        shopping_list = ShoppingList.find(params[:id])
        if shopping_list
          render json: shopping_list
        else
          render json: { errors: shopping_list.errors }, status: :unprocessable_entity
        end
      end

      def create
        # Implement code to create a new user
        shopping_list = ShoppingList.new(name: params[:name], user_id: params[:user_id], item_price: params[:item_price], quantity: params[:quantity], expiry_date: params[:expiry_date])
        if shopping_list.save
          render json: shopping_list
        else
          render json: { errors: shopping_list.errors }, status: :unprocessable_entity
        end
      end

      def update
        # Implement code to update an existing user
        shopping_list = ShoppingList.find(params[:id])
        if shopping_list.update(shopping_list_params)
          render json: shopping_list
        else
          render json: { errors: shopping_list.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        # Implement code to delete a user
        shopping_list = ShoppingList.find(params[:id])
        if shopping_list.destroy
          render json: shopping_list
        else
          render json: { errors: shopping_list.errors }, status: :unprocessable_entity
        end
      end

      private

      def shopping_list_params
        params.require(:shopping_list).permit(:name, :user_id, :item_price, :quantity, :expiry_date)
      end
end
