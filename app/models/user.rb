class User < ApplicationRecord
    
    VALID_EMAIL_REGEX = /[a-zA-Z0-9._+]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)+/
    validates :name, presence: true, length: { maximum: 15 }
    validates :email, format: {with: VALID_EMAIL_REGEX}
    
    
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/
    
    validates :password, format: { with: VALID_PASSWORD_REGEX}
    #:password_confirmationはいらない（そもそも完全一致しないとうけつけないから）
    
    has_secure_password
    
    has_many :topics
    has_many :favorites
    has_many :favorite_topics, through: :favorites, source: 'topic'
end
