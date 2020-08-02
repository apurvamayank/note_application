require 'test_helper'

class NotesControllerTest < ActionDispatch::IntegrationTest
  test 'should redirect if user is not logged in' do
    get notes_url
    assert_response :redirect
  end

  test 'should get index' do
    get notes_url(as: users(:one))
    assert_response :success
  end

  test 'should get show' do
    note = notes(:one)
    get note_url(note, as: users(:one))
    assert_response :success
  end

  test 'should create with post request and params' do
    note = { title: 'test title', body: 'test body' }
    post notes_url(as: users(:one)), params: { note: note }
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test 'should delete notes' do
    note = notes(:one)

    delete note_url(note, as: users(:one))
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end
end
