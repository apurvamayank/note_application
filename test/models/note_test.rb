require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  test 'note with title body and user_id is valid' do
    note = notes(:one)
    assert note.valid?
  end

  test 'note without user_id is invalid' do
    note = Note.new(title: 'test', body: 'test body')
    assert note.invalid?
  end

  test 'note without body is valid' do
    note = Note.new(title: 'test title', user_id: 1)
    assert note.valid?
  end

  test 'note without body and title is invalid' do
    note = Note.new(user_id: 1)
    assert note.invalid?
  end
end
