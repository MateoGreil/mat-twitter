
class User < ApplicationRecord
    include BCrypts

    validates :email, presence: true
    validates :name, presence: true

    def password=(new_password)
        self.password_digest = Password.create(new_password)
    end

end
