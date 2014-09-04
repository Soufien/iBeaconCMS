class User < ActiveRecord::Base
  # Include the following devise modules. Others available are:
  # :confirmable, :lockable, :recoverable, :registerable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable

  has_many :apps

  def full_name
    [first_name, last_name].join(' ')
  end
end
