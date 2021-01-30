class CommentsController < ApplicationController
  def create
    @proposal = Proposal.find(params[:proposal_id])
    @comment = @proposal.comments.new(comment_params)
    @comment.save
    redirect_to "/proposals/#{@comment.proposal.id}"
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id)
  end
end
