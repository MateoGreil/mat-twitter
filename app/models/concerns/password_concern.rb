module PasswordConcern
    extend ActiveSupport::Concern
    include BCrypt

    included do
        attr_accessor :password
        validates :password, presence: true
    end
    module ClassMethods
        # Ici nous allons mentionnés toutes les méthodes de classe et d'instances pouvant être mutualisées.
        # Les méthodes déclarées dans ce module deviennent des méthodes de classe sur la classe cible ( où l'on inclus notre concern ).
        def hash_password
            self.password_digest = Password.create(:password)
        end

        private
        # les méthodes privées ne pouvant être appelées qu'à l'intérieur de ce concern.
    end
end