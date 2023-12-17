require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    # Email, first name, and last name should also be required
    it 'requires all fields' do
      user = User.new(
        email: nil,
        first_name: nil,
        last_name: nil,
        password: nil,
        password_confirmation: nil
      )

      user.valid?

      expect(user.errors[:email]).to include("can't be blank")
      expect(user.errors[:first_name]).to include("can't be blank")
      expect(user.errors[:last_name]).to include("can't be blank")
      expect(user.errors[:password]).to include("can't be blank")
      expect(user.errors[:password_confirmation]).to include("can't be blank")
    end
    it 'must be created with a password and password_confirmation fields' do
      user = User.new(
        email: 'user@example.com',
        password: 'password',
        password_confirmation: 'password2'
      )
      user.valid?

      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

#It must be created with a password and password_confirmation fields
# These need to match so you should have an example for where they are not the same
# These are required when creating the model so you should also have an example for this
    it 'requires password and password_confirmation' do
      user = User.new(email: 'user@example.com')

      user.valid?

      expect(user.errors[:password]).to include("can't be blank")
      expect(user.errors[:password_confirmation]).to include("can't be blank")
    end

    # Emails must be unique (not case sensitive; for example, TEST@TEST.com should not be allowed if test@test.COM is in the database)
    it 'Emails must be unique (case insensitive)' do
      current_user = User.create(
        first_name: 'John',
        last_name: 'Jo',
        email: 'test@test.COM',
        password: 'password',
        password_confirmation: 'password'
      )
      user = User.new(
        first_name: 'John',
        last_name: 'Jo',
        email: 'TEST@TEST.com',
        password: 'password2',
        password_confirmation: 'password2'
      )
   
    expect(user).not_to be_valid
    end

    # The password must have a minimum length when a user account is being created.

    it 'requires a minimum password length on create' do
      user = User.new(
        email: 'TEST@TEST.com',
        password: 'five', 
        password_confirmation: 'five'
      )
      user.valid?
    
      expect(user.errors[:password]).to include('is too short (minimum is 5 characters)')
    end
    it "should be authenticated successfully with spaces before and/or after email" do
      current_user = User.create(first_name: "John", last_name: "Jo", email: "test@test.com", password: "five5", password_confirmation: "five5")
      user = User.authenticate_with_credentials("     test@test.com  ", "five5")

      expect(user).to eq(current_user)
    end
    it "should be authenticated successfully with the wrong case for their email" do
      current_user = User.create(first_name: "John", last_name: "Jo", email: "test@test.com", password: "five5", password_confirmation: "five5")
      user = User.authenticate_with_credentials("TEST@TEST.com   ", "five5")

      expect(user).to eq(current_user)
    end
  end
end
