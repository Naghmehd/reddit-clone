require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new Post" do
        expect{
          post :create, params: { post: { title: 'The Big Bang Theory' } }
        }.to change{Post.count}.from(0).to(1)
      end
      it "redirects to the home page" do
        post :create, params: { post: { title: 'The Big Bang Theory' } }
        response.should redirect_to root_path
      end
    end

    context "with invalid attributes" do
      it "does not create a new post " do
        expect {
         post :create, params: { post: { title: '' } }
       }.to_not change{Post.count}
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:post) { Post.create(title: 'Hello') }
    it "delete a post" do
      expect {
        delete :destroy, params: { id: post.id }
      }.to change{Post.count}.by(-1)
    end
  end
end
