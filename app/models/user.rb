class User < ApplicationRecord
  # 为了确保不同的db有不同的情况
  before_save { self.email = self.email.downcase }
  # 对model写入的情况加限制 这里就是实际写的validation
  validates :name, presence: true, length:{maximum:50}
  
  
  VALID_EMAIL_REGEX = VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length:{maximum:255},
                                    format: {with: VALID_EMAIL_REGEX},
                                    uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
                                    
  has_secure_password
  
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
