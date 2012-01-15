require 'test_helper'

class UploadsControllerTest < ActionController::TestCase

  test "routes" do
    assert_routing '/uploads', :controller => 'uploads', :action => 'index'
    assert_routing '/uploads/new', :controller => 'uploads', :action => 'new'
    assert_routing '/uploads/123', :controller => 'uploads', :action => 'show', :id => '123'
    assert_routing({:method => :post, :path => '/uploads'}, {:controller => 'uploads', :action => 'create'})
  end

  test 'new returns a valid new form' do 
    get :new
    assert_response :success
    assert_template :new
  end

  test 'show will display errors properly' do
    upload = Factory(:upload, :error => 'this is an error', :partial => 12.0)
    get :show, :id => upload.id
    assert_response :success
    assert_template :show
    assert_match /this is an error/, @response.body
    assert_match /Seems to be a problem with your uploaded file/, @response.body
    assert_match /This Upload's total is: 12.0/, @response.body
  end

  test 'show will display a message when upload hasnt being processed yet' do
    upload = Factory(:upload, :partial => nil)
    get :show, :id => upload.id
    assert_response :success
    assert_template :show
    assert_match /File hasnt being process yet, comeback later for your results/, @response.body
  end

  test 'index will display all the uploads' do
    Upload.destroy_all
    uploads = [Factory(:upload), Factory(:upload)]
    get :index
    assert_equal uploads,assigns(:uploads) 
  end

  test 'index will display error when one file has errors' do
    Factory(:upload, :error => 'blah')
    get :index
    assert_match 'See Errors', @response.body
  end

  test 'index will display error when one file hasnt beeing parsed yet' do
    Factory(:upload, :partial => nil)
    get :index
    assert_match 'Not parsed Yet', @response.body
  end

  test 'create will re render new with errors if unable to create upload' do
    post :create, :upload => {}
    assert_response :success
    assert_template :new
    assert_match /prohibited this upload from being saved/, @response.body    
  end

  test 'create will render show if able to create upload' do
    upload = Factory.build(:upload)
    post :create, :upload => upload.attributes
    assert_response :redirect
    assert_redirected_to upload_path(assigns(:upload))
  end

end
