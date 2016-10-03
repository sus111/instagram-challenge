class Like < ApplicationRecord
  belongs_to :picture
  belongs_to :user

  validates :user, uniqueness: { scope: :picture }
end
