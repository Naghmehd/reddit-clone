require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:post) { Post.create(title: 'Hello') }
  let(:comment) { Comment.new(description: 'hi', post_id: post.id) }

  describe '#validations' do
    context 'when a comment has description and post id' do
      it 'should be valid' do
        expect(comment.valid?).to be true
      end
    end

    context 'when comment description is blank' do
      before { comment.description = "" }
      it 'should be invalid' do
        expect(comment.valid?).to be false
      end
    end

    context 'when comment post_id is blank' do
      before { comment.post_id = nil }
      it 'should be invalid' do
        expect(comment.valid?).to be false
      end
    end
  end
end
