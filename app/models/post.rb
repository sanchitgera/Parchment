class Post < ActiveRecord::Base
  has_and_belongs_to_many :categories
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true, length: {minimum: 100}
end
