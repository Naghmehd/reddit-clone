require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_user) { User.new(email: 'naghmeh@gmail.com', password: 'Password', password_confirmation: 'Password') }
  let(:invalid_user_email) { User.new(email: 'naghmeh') }
  let(:invalid_user_password) { User.new(email: 'naghmeh@gmail.com', password: 'Pass', password_confirmation: 'Pass' ) }

  describe '#validations' do
    context 'email'do
      it "requires an email" do
        expect(valid_user.valid?).to be true
      end

      context "requires the email to look like an email" do
        it 'should have errors "is invalid"' do
          invalid_user_email.valid?
          expect(invalid_user_email.errors.full_messages.to_s).to match(/is invalid/)
        end
      end

      context "requires the password to have min 6 characters" do
        it 'should have errors "is too short (minimum is 6 characters)" ' do
          invalid_user_password.valid?
          expect(invalid_user_password.errors.full_messages.to_s).to match(/Password is too short/)
        end
      end

    end
  end
end
