require 'test_helper'

class ProjectAttachmentsControllerTest < ActionController::TestCase
  setup do
    @project_attachment = project_attachments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_attachments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_attachment" do
    assert_difference('ProjectAttachment.count') do
      post :create, project_attachment: { picture: @project_attachment.picture, project_id: @project_attachment.project_id }
    end

    assert_redirected_to project_attachment_path(assigns(:project_attachment))
  end

  test "should show project_attachment" do
    get :show, id: @project_attachment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_attachment
    assert_response :success
  end

  test "should update project_attachment" do
    patch :update, id: @project_attachment, project_attachment: { picture: @project_attachment.picture, project_id: @project_attachment.project_id }
    assert_redirected_to project_attachment_path(assigns(:project_attachment))
  end

  test "should destroy project_attachment" do
    assert_difference('ProjectAttachment.count', -1) do
      delete :destroy, id: @project_attachment
    end

    assert_redirected_to project_attachments_path
  end
end
