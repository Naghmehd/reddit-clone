require "rails_helper"

RSpec.describe Post, type: :model do
  it { should validate_presence_of(:title) }
  it { should_not allow_value(" ").for(:title) }
  it do
    should validate_length_of(:title).is_at_least(3)
  end
end
