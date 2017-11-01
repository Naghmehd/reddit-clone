require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:comment_params) { comment: { description: 'Awesome post!' } }
  let(:post_id) { (1..100).sample }
  let(:create!) { post :create, comment: comment_params, poste_id: post_id }

  it "creates new comment" do
    expect { create! }.to change { Comment.count }.by 1
  end

  it "assigns given comment to correct post" do
    create!
    expect(assigns(:comment).post_id).to eq params[:post_id]
  end
end
