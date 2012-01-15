require 'test_helper'

class UploadTest < ActiveSupport::TestCase
  should have_attached_file(:document)
  should validate_attachment_presence(:document) 
  should have_many(:purchases)


  test 'valid scope only returns valid uploads' do
    Upload.destroy_all
    valid = [Factory(:upload), Factory(:upload)]
    error = Factory(:upload, :error => 'this is an error')
    not_processed = Factory(:upload, :partial => nil)
    assert_equal valid, Upload.valid
  end

end
