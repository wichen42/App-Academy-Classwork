class User < ApplicationRecord
    attr_reader :password

    before_validation :ensure_session_token

    # all columns need to be not null / presence true
    # only name(email) and session_token needs to be unique
    validates :email, :session_token, presence: true, uniqueness: true 
    validates :password_digest, presence: true
    # 
    validates :password, length: {minimum: 6, allow_nil: true}



    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)
        if user && user.is_password?(password)
            user
        else
            nil
        end
    end

    def generate_session_token # generates new session token and checks to see if generated session token is already in use
        loop do
            session_token = SecureRandom::urlsafe_base64(16)
            return session_token unless User.exists?(session_token: session_token)
        end
    end

    def password=(password) # overwrites default password setter method. populates user's password digest column with BCrypt object
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password) # converts password_digest into BCrypt object that allows us to compare to password passed in
        password_object = BCrypt::Password.new(self.password_digest)
        password_object.is_password?(password)
        # BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def reset_session_token! # updates user's session_token and returns new session_token
        self.session_token = generate_session_token
        self.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= generate_session_token
    end

end



