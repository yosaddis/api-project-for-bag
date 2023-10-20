module Api
class UsersController < ApplicationController

    def index
        # Implement code to fetch and return a list of users
        users= User.all
        render json: users
      end

      def show
        # Implement code to fetch and return a specific user
        user = User.find(params[:id])
        if user
          render json: user
        else
          render json: { errors: user.errors }, status: :unprocessable_entity
        end
      end

      def create
        # Implement code to create a new user
        user = User.new(username: params[:username], email: params[:email])
        if user.save
          render json: user
        else
          render json: { errors: user.errors }, status: :unprocessable_entity
        end
      end

      def update
        # Implement code to update an existing user
        user = User.find(params[:id])
        if user.update(user_params)
          render json: user
        else
          render json: { errors: user.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        # Implement code to delete a user
        user = User.find(params[:id])
        if user.destroy
          render json: user
        else
          render json: { errors: user.errors }, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:username, :email)
      end

end
end
