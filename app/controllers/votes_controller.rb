class VotesController < ApplicationController
  before_action :required_user, except: [:index, :show]
  before_action :look_up_vote, only: :create

  def new
    @vote = Vote.new
  end

  def create
    if @vote.present?
      @vote.value = vote_params[:value]
    else
      @vote = current_user.votes.build(vote_params)
    end

    if @vote.save
      redirect_back(fallback_location: root_path)
    end
  end

  private

    def vote_params
      # { vote: { voteable_type: 'Post', voteable_id: '1', value: '1', hack_everything: '123' } }
      params.require(:vote).permit(:voteable_type, :voteable_id, :value)
    end

    def look_up_vote
      @vote = current_user.votes.find_by(voteable_type: vote_params[:voteable_type], voteable_id: vote_params[:voteable_id])
    end
end
