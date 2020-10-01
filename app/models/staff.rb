require 'bcrypt'
class Staff < ActiveRecord::Base
  has_many :students,through: :projects
  has_and_belongs_to_many :panels
  has_many :progresses
  has_many :projects
  
  has_many :sender, class_name: "Message", primary_key: "email", foreign_key: "from", dependent: :destroy
  has_many :receiver, class_name: "Message", primary_key: "email", foreign_key: "to", dependent: :destroy
  validates :name, presence: true
  validates :emp_id, presence: true,uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
  include BCrypt
  def password
     @password ||= Password.new(password_digest)
  end
  def password=(password_digest)
    @password = Password.create(password_digest)
    self.password_digest = @password
  end

end
