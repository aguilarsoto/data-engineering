class Upload < ActiveRecord::Base
  validates_attachment_presence :document

  has_attached_file :document,
    :storage => :s3,
    :s3_credentials => Rails.root.join("config/s3.yml"),
    :path => '/documents/:id/:filename'
  
  

end
