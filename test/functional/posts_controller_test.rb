require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  def setup
    clean_couch
  end
  
  test "#show gets the post by slug" do
    post = Post.create(:slug => 'test-post')
    get :show, :id => 'test-post'
    assert_equal post.id, assigns(:post).id
  end
  
  test "#edit gets the post by slug" do
    post = Post.create(:slug => 'test-post')
    get :edit, :id => 'test-post'
    assert_equal post.id, assigns(:post).id
  end
  
  test "#update updates the specified post on success" do
    post = Post.create(:slug => 'test-post', :title => 'old-title')
    put :update, :id => 'test-post', :post => {:slug => 'test-post', :title => 'new-title' }
    assert_equal 'new-title', assigns(:post).title
    assert_redirected_to :action => 'show', :id => 'test-post'
  end  
end