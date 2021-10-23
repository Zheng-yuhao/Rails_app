class User < ApplicationRecord
  attr_accessor :remember_token
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
  
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  def remember
    self.remember_token = User.new_token
    self.update_attribute(:remember_digest, User.digest(self.remember_token))
  end  
  # User的instance variable的话定义在这里的method都能用
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
  def forget
    update_attribute(:remember_digest, nil)
  end
end
