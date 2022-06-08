class UsersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :user_not_found

  def show
    user = User.find_by(id: params[:id])
    render json: user, include: :items
  end

  private

  def user_not_found
    render json: {error: 404}, status: :not_found
  end

end
