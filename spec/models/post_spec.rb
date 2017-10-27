require "rails_helper"

RSpec.describe Post, type: :model do
  it { should validate_presence_of(:title) }
  it { should_not allow_value(" ").for(:title) }
  it do
    should validate_length_of(:title).is_at_least(3)
  end

  let(:valid_post) { Post.new(title: 'Hello') }
  let(:invalid_post) { Post.new(title: '') }

  describe '#validations' do
    context 'when the post has a valid title' do
      it 'should be valid' do
        expect(valid_post.valid?).to be true
      end

      it 'should save' do
        expect(valid_post.save).to be true
      end
    end

    context 'when the post has an blank title' do
      it 'should have errors "can\'t be blank"' do
        invalid_post.valid?
        expect(invalid_post.errors.full_messages.to_s).to match(/be blank/)
      end
    end
  end
end
