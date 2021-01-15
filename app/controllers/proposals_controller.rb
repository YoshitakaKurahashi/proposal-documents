class ProposalsController < ApplicationController
  def index
  end

  def new
    @proposal = Proposal.new
  end

  def create
    @proposal = Proposal.new(proposal_params)
    binding.pry
    if @proposal.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def proposal_params
    params.require(:proposal).permit(:title, user_ids: [])
  end
end
