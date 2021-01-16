class ProposalsController < ApplicationController

  def index
    @proposals = Proposal.all.order('created_at DESC')
  end

  def new
    @proposal = Proposal.new
  end

  def create
    @proposal = Proposal.new(proposal_params)
    # binding.pry
    if @proposal.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @proposal = Proposal.find(params[:id])
  end

  private
  def proposal_params
    params.require(:proposal).permit(:title, user_ids: [])
  end
end
