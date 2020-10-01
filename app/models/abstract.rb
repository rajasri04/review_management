class Abstract < ActiveRecord::Base
  belongs_to :project

  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  validates :name, presence: true

end
