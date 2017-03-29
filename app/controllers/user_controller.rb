class UserController < ApplicationController
  
  before_action :authenticate_user!
  
  def show
    id = params[:id]
    history = History.find_by(id: id)
    render json: history
  end
  
  def index
    histories = History.all
    render json: histories
  end
end
