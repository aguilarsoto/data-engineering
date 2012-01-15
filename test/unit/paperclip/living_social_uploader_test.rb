require 'test_helper'

class LivingSocialUploadTest < Test::Unit::TestCase
  
  def teardown
   Item.destroy_all
   Merchant.destroy_all
   Purchaser.destroy_all
   Purchase.destroy_all
  end
  
  should "not update data if there is a problem with the upload" do
    file = open(Rails.root.join('test/fixtures/valid0.tab'))
    upload = Factory.build(:upload)
    attachment = Paperclip::Attachment.new(:avatar, upload, {}) 
    Paperclip::LivingSocialUpload.make(file, {}, attachment)
    assert_equal 0, Item.count
  end
 
  should "make recieves a valid file parses it out and fills the db" do
    file = open(Rails.root.join('test/fixtures/valid0.tab'))
    upload = Factory(:upload)
    attachment = Paperclip::Attachment.new(:avatar, upload, {}) 
    Paperclip::LivingSocialUpload.make(file, {}, attachment)
    assert_equal 3, Item.count
    assert_equal 3, Merchant.count
    assert_equal 3, Purchaser.count
    assert_equal 3, Purchase.count
    upload.reload
    assert_equal "75.0", upload.partial.to_s
  end

  should "handle collitions on item and merchant properly" do
    file = open(Rails.root.join('test/fixtures/valid1.tab'))
    upload = Factory(:upload)
    attachment = Paperclip::Attachment.new(:avatar, upload, {}) 
    Paperclip::LivingSocialUpload.make(file, {}, attachment)
    assert_equal 3, Item.count
    assert_equal 3, Merchant.count
    assert_equal 4, Purchaser.count
    assert_equal 4, Purchase.count
    upload.reload
    assert_equal "95.0", upload.partial.to_s    
  end

  should "handle collitions on purchasers properly" do
    file = open(Rails.root.join('test/fixtures/valid2.tab'))
    upload = Factory(:upload)
    attachment = Paperclip::Attachment.new(:avatar, upload, {}) 
    Paperclip::LivingSocialUpload.make(file, {}, attachment)
    assert_equal 4, Item.count
    assert_equal 4, Merchant.count
    assert_equal 3, Purchaser.count
    assert_equal 4, Purchase.count
    upload.reload
    assert_equal "95.0", upload.partial.to_s
  end

  should "handle crashing file in the middle of an upload" do
    file = open(Rails.root.join('test/fixtures/invalid0.tab'))
    upload = Factory(:upload)
    attachment = Paperclip::Attachment.new(:avatar, upload, {})
    Paperclip::LivingSocialUpload.make(file, {}, attachment)
    assert_equal 1, Item.count
    assert_equal 1, Merchant.count
    assert_equal 1, Purchaser.count
    assert_equal 1, Purchase.count
    upload.reload
    assert_equal "20.0", upload.partial.to_s
    assert_match "Quantity is not a number", upload.error
  end

  should "handle crashing file invalid csv formating" do
    file = open(Rails.root.join('test/fixtures/invalid1.tab'))
    upload = Factory(:upload)
    attachment = Paperclip::Attachment.new(:avatar, upload, {})
    Paperclip::LivingSocialUpload.make(file, {}, attachment)
    assert_equal 0, Item.count
    upload.reload
    assert_match "Unclosed quoted field on line 1.", upload.error
  end


end
