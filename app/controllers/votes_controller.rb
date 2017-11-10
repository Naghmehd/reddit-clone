class VotesController < ApplicationController
  before_action :required_user, except: [:index, :show]

  def new
    @vote = Vote.new
  end

  def create
    @vote = current_user.votes.build(vote_params)
    byebug
    if @vote.save
      redirect_back(fallback_location: root_path)
    end
  end

  private

    def vote_params
      params.require(:vote).permit(:voteable_type, :voteable_id, :value)
    end
end
