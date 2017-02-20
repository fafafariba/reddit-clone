require 'rails_helper'

# RSpec.describe User, type: :model do
  #What to test?
    #Validations
    #Associations
    #Class methods
    #Error messages

RSpec.describe User, type: :model do
  subject(:user) { FactoryGirl.build(:user) }
  let (:password) { 'cherry' }
  let (:short_password) { 'apple' }
  let (:bad_password) { 'watermelon' }

  #Uniquness needs subject to test
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_uniqueness_of(:session_token) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

    # it 'should validate presence of password_digest' do
    #   user = User.new(username: username)
    #   expect(user.valid?).to be false
    #
    # end
    # it 'should vaildate length of password' do
    #   user = User.new(username: username, password: "passw")
    #   expect(user.valid?).to be false
    # end

    it { should have_many(:subs) }
    it { should have_many(:user_votes) }
    it { should have_many(:comments) }


    describe '::find_by_credentials' do

      it 'returns user when given valid params' do
        user.save
        expect(User.find_by_credentials(user.username, password)).to eq(user)
      end

      it 'returns nil when given invalid params' do
        expect(User.find_by_credentials(user.username, bad_password)).to be nil
      end
    end

    describe '#reset_session_token' do

      it 'resets the session token' do
        current_session_token = user.session_token
        user.reset_session_token!
        expect(user.session_token).not_to eq(current_session_token)
      end
    end

    describe '#is_password?' do

      it 'verifies the correct password is correct' do
        expect(user.is_password?(user.password)).to be true
      end

      it 'verifies the incorrect password is incorrect' do
        expect(user.is_password?(bad_password)).to be false
      end
    end

end
