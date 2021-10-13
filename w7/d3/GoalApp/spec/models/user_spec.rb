require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  
  #validations
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_uniqueness_of(:username)}
  it { should validate_length_of(:password).is_at_least(6) }
  
  #Associations 
  it { should have_many(:goals)}
  it { should have_many(:comments)}
  it { should have_many(:comments_made)}
  
  #methods SPIRE CRLLL
  #self.find_by_credentials 
  describe "finds users" do 
    # let(:user1) {User.new(username: "John", password:"password")}
    # let(:user2) {User.new(username: "Jill", password:"p4567d")}
    user1 = User.create!(username: "Jonh", password: "password", session_token: "B")
    user2 = User.create!(username: "Jill", password: "12345678", session_token: "C")
    expect(user1.find_by_credentials("John", "password")).to eq(user1)
    expect(user1.find_by_credentials("Jill", "12345678")).to eq(nil)



  end

end
