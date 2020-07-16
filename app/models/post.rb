class Post < ApplicationRecord
  belongs_to :admin_user
  belongs_to :category
  has_many :comments, dependent: :destroy
end
