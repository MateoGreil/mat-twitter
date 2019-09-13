class User < ApplicationRecord
    include PasswordConcern
end
