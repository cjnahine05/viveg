require 'bcrypt'
class Merchant < ActiveRecord::Base

    include BCrypt

    validates :email, :presence => true


    def password
      @password ||= Password.new(self.encrypted_password)
    end

    def password=(new_password)
      @password = Password.create(new_password)
      self.encrypted_password = @password
    end


  end
