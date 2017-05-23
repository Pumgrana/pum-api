class PluginController < ApplicationController

  before_action :authenticate_user!
  
  def create
    enter_date = params[:enter_date]
    leave_time = params[:leave_time]
    focus_elasped_time = params[:focus_elasped_time]
    total_elasped_time = params[:total_elasped_time]
    history = History.create(email: current_user.email,
                              url: params[:url],
                              origin_url: params[:origin_url],
                              target_url: params[:target_url],
                              lang: params[:lang],
                              title: params[:title],
                              description: params[:description],
                              image: params[:image],
                              search: params[:search],
                              enter_date: enter_date,
                              leave_time: leave_time,
                              focus_elasped_time: focus_elasped_time,
                              total_elasped_time: total_elasped_time,
                              user_id: current_user.id)
    history.save
    render json: history
  end
  
  def destroy
    id = params[:id]
    history = History.find_by(id: id)
    if history != nil
      history.destroy
    end
    render json: history
  end
end
