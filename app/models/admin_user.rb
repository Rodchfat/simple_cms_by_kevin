class AdminUser < ActiveRecord::Base
    has_and_belongs_to_many :pages
    has_many :section_edits
    has_many :sections, :through => :section_edits
    has_secure_password
    EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
    FORBIDDEN_USERNAMES = ['littlebopeep','humptydumpty','marymary']
    
    validates :first_name, :presence => true,
                          :length => { :maximum => 25 }
    validates :last_name, :presence => true,
                          :length => { :maximum => 50 }
    validates :username, :length => { :within => 4..25 },
                         :uniqueness => true
    validates :email, :presence => true,
                      :length => { :maximum => 100 },
                      :format => EMAIL_REGEX,
                      :confirmation => true

    def first_and_last
        "#{first_name} #{last_name}"
    end
     scope :sorted, -> {order('first_name ASC, last_name ASC')}
    
    
    private 
    def username_is_allowed
        if FORBIDDEN_USERNAME.include?(username)
            errors.add(:username, "has been restricted from use")
        end
    end
    
    
    
    
    
    
    
    
    
    
    
end
