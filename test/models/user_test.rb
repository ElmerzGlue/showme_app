require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
  	@user = User.new(name: 'bob bobertson', email: 'bob@example.com', school: 'Harvard', 
      password: 'password', password_confirmation: 'password' )
  end

  test "should be valid" do
  	assert @user.valid?
  end

  test "name should be present" do
  	@user.name = '   '
  	assert_not @user.valid?
  end


  test "email should be valid" do
  	invalids = ['email@email', 'personatperson.com', '@gmail.com']
  	invalids.each{|t|
  		@user.email = t
  		assert_not @user.valid?
    }
  end

  test "valid emails should be valid" do
  	valids = ['email@email.com', '123go@mail.com', 'a.b.c@fmail.com']
  	valids.each { |t| 
  		@user.email = t
  		assert @user.valid?
    }
  end

end
