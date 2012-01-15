class Upload < ActiveRecord::Base
  has_many :purchases

  validates_attachment_presence :document

  scope :valid, where("error is null AND partial is not null")

  has_attached_file :document, :styles => {:original => {}},
    :processors => [:living_social_upload],
    :storage => :s3,
    :s3_credentials => Rails.root.join("config/s3.yml"),
    :path => '/documents/:id/:filename'
 
    process_in_background :document 
  

end
