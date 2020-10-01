require 'bcrypt'
class Student < ActiveRecord::Base
  has_one :project,through: :group, dependent: :destroy
  has_many :staffs,through: :project
  has_many :abstracts,through: :project
  has_one :student_group
  has_one :group,through: :student_group
  has_many :progresses
  has_many :receiver, class_name: "Message", primary_key: "email", foreign_key: "to", dependent: :destroy
  has_many :sender, class_name: "Message", primary_key: "email", foreign_key: "from", dependent: :destroy
  validates :name, presence: true
  validates_confirmation_of :password
  attr_accessor :password
  validates :password, confirmation: true
  validates :reg_no, presence: true,uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
  def rev0
     @progress = Progress.where("student_id == ?", id)
     provided = @progress.where("review0 > ?",0).count
     rev0_marks = @progress.sum("review0")/provided.to_f
     rev0_marks
  end
  def rev1
     @progress = Progress.where("student_id == ?", id)
     provided = @progress.where("review1 > ?",0).count
     rev0_marks = @progress.sum("review1")/provided.to_f
     rev0_marks
  end
  def rev2
     @progress = Progress.where("student_id == ?", id)
     provided = @progress.where("review2 > ?",0).count
     rev0_marks = @progress.sum("review2")/provided.to_f
     rev0_marks
  end
  def rev3
     @progress = Progress.where("student_id == ?", id)
     provided = @progress.where("review3 > ?",0).count
     rev0_marks = @progress.sum("review3")/provided.to_f
     rev0_marks
  end
  def internal_marks
    (self.rev0 +   self.rev1 +   self.rev2 +   self.rev3) / 4.to_f
  end
  include BCrypt
  def password
     @password ||= Password.new(password_digest)
  end
  def password=(password_digest)
    @password = Password.create(password_digest)
    self.password_digest = @password
  end

end
