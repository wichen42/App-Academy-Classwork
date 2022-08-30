class User < ApplicationRecord
    before_validation :ensure_session_token

    attr_reader :password

    validates :username, :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true

    def password=(password) # setting password_digest
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end

    def is_password?(password) # checking if passed in password will equal to password digest
        password_object = BCrypt::Password.new(self.password_digest) # creates BCrypt object from password_digest
        password_object.is_password?(password) # allows BCrypt to compare session password to created password_object
    end

    def self.find_by_credentials(username, password) # returns user if username and password matches
        user = User.find_by(username: username)
        if user && user.is_password?(password)
            user
        else    
            nil
        end
    end



    private

    def generate_unique_session_token # creates a new session token and ensures that new session token does not already exists
        token = SecureRandom::urlsafe_base64
        while User.exists?(session_token: token)
            token = SecureRandom::urlsafe_base64
        end
        return token
    end

    def reset_session_token! # overwrites existing session_token and ensures we see errors
        self.session_token = generate_unique_session_token
        self.save!
        return self.session_token
    end

    def ensure_session_token # if there is not already a session token, create a new one
        self.session_token ||= generate_unique_session_token
    end

end
