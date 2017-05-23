class PluginController < ApplicationController

  before_action :authenticate_user!
  before_action :require_params, only: :create

  def create
    url = params[:url]
    enter_date = params[:enter_date]
    current_history = History.find_by(url: url, enter_date: enter_date)
    leave_time = params[:leave_time]
    if  current_history == nil
      focus_elasped_time = params[:focus_elasped_time]
      total_elasped_time = params[:total_elasped_time]
      history = History.create(
                              url: params[:url],
                              origin_url: params[:origin_url],
                              target_url: params[:target_url],
                              lang: params[:lang],
                              title: params[:title],
                              description: params[:description],
                              image: params[:image],
                              search: params[:search],
                              enter_date: enter_date,
                              leave_date: leave_time,
                              focus_elasped_time: focus_elasped_time,
                              total_elasped_time: total_elasped_time,
                              user_id: current_user.id)
      history.save
    else
      current_history.url = params[:url]
      current_history.origin_url = params[:origin_url]
      current_history.target_url = params[:target_url]
      current_history.lang = params[:lang]
      current_history.title = params[:title]
      current_history.description = params[:description]
      current_history.image = params[:image]
      current_history.search = params[:search]
      current_history.enter_date = enter_date
      current_history.leave_date = leave_time
      current_history.focus_elasped_time = focus_elasped_time
      current_history.total_elasped_time = total_elasped_time
      current_history.user_id = current_user.id
    end
    #render json: current_history
  end
  
  def destroy
    id = params[:id]
    history = History.find_by(id: id)
    if history != nil
      history.destroy
    end
    #render json: history
  end

  private
  def require_params
    params.require(:plugin).permit(:url)
  end

end
