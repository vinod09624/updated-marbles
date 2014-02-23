require 'spec_helper'

describe User do
  
  before do 
   @user = User.new(email: "user@example.com") 
  end
  
  subject { @user }
  
  it { should respond_to(:email) }
  
  it { should be_valid }
  
  describe "when email is not valid" do
    before { @user.email = " "}
    it { should_not be_valid}
  end 
  
  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@gmail,com user_at_foo.org example.user@foo@bar.com 
                     foo@bar_hey.com foo@bar+bar.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end
  
  describe "when email address" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end
    
    it { should_not be_valid }
  end     
end       


