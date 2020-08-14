class User < ApplicationRecord
    
    VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/
    validates :name, presence: true, length: { maximum: 15 }
    validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
    
    
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])[a-z\d]{8,32}+\z/
    
    validates :password, presence: true, length: { in: 8..32 }, format: { with: VALID_PASSWORD_REGEX}
    validates :password_confirmation, presence: true, length: { in: 8..32 }, format: { with: VALID_PASSWORD_REGEX}
    
    has_secure_password
end
