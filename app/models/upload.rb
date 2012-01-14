class Upload < ActiveRecord::Base
  has_many :purchases

  validates_attachment_presence :document
  validates_attachment_content_type :document, :content_type => ["text/plain", "text/csv", "text/tsv"]

  has_attached_file :document, :styles => { :original => {}},
    :storage => :s3,
    :s3_credentials => Rails.root.join("config/s3.yml"),
    :path => '/documents/:id/:filename'
  
  

end
