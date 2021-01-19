class LikesController < ApplicationController
  def create
    Like.create(user_id: current_user.id, proposal_id: params[:id])
    redirect_to proposal_path
  end

  def destroy
    Like.find_by(user_id: current_user.id, proposal_id: params[:id]).destroy
    redirect_to proposal_path
  end
end
