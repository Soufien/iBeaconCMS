class User < ActiveRecord::Base
  validates :email,
            :first_name,
            :last_name,
            presence: true

  validates :email,
            uniqueness: true,
            email: true

end