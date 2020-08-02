class Note < ApplicationRecord
  belongs_to :user
  validates :title, length: { maximum: 30 }
  validates :title, presence: true
  validates :body, length: { maximum: 1000 }
  before_validation :check_title

  default_scope { order(created_at: :desc) }

  private

  def check_title
    return if !title.blank?

    self.title = body[0...30] if !body.blank?
  end
end
