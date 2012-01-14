require 'test_helper'

class UploadTest < ActiveSupport::TestCase
  should have_attached_file(:document)
  should validate_attachment_presence(:document) 


end
