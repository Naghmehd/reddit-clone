require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:postv) { Post.create(title: 'hio') }

  describe 'COMMENT #new' do
    context 'with post id' do
      it 'responds with 200' do
        get :new, params: { post_id: postv.id }
        expect(response.status).to eq(200)
      end
    end

    context 'without a post id' do
      it 'responds with 404' do
        expect {
          get :new, params: { post_id: '' }
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe 'COMMENT #create' do
    context 'with description and post id' do
      it 'creates the comment' do
        params = { comment: {description: 'cool', post_id: postv.id } }
        expect{
          post :create, params: params
        }.to change{Comment.count}.from(0).to(1)
      end
    end

    context 'with empty description' do
      it 'should have an error' do
        params = { comment: {description: '', post_id: postv.id } }
        post :create, params: params
        expect(flash[:error].to_s).to match(/can't be blank/)
      end
    end
  end
end
