require 'test_helper'

class UploadTest < ActiveSupport::TestCase
  should have_attached_file(:document)
  should validate_attachment_presence(:document) 
  should have_many(:purchases)


  should validate_attachment_content_type(:document).allowing('text/plain', 'text/csv', 'text/tsv')

end
