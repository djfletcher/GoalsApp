class GoalsController < ApplicationController

  def index
    @goals = current_user.goals
    render :index
  end

end
