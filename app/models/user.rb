class User < ApplicationRecord
  include Clearance::User
  has_many :notes, dependent: :destroy

  def full_name
  	first_name + " " +last_name
  end
end
