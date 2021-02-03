class ProposalsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :new]
  before_action :set_proposal, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show, :new, :create]

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
    @comment = Comment.new
    @comments = @proposal.comments.includes(:user)
    @like = Like.new
    @likes = @proposal.likes.includes(:user)
  end

  def edit
  end

  def update
    if @proposal.update(proposal_params)
      redirect_to proposal_path
    else
      render :edit
    end
  end

  def destroy
    @proposal.destroy
    redirect_to root_path
  end

  private

  def proposal_params
    params.require(:proposal).permit(
      :title,
      :detail,
      :term_start,
      :term_end,
      :target_group,
      :numeric,
      :budget,
      :payment,
      user_ids: []
    )
  end

  def set_proposal
    @proposal = Proposal.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in? && current_user.id == @proposal.user_ids[0]
  end
end
