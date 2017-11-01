require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'belongs to post' do
    relation = described_class.reflect_on_association(:post)
    expect(relation.macro).to eq :belongs_to
  end
end
