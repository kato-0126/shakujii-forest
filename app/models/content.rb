class Content < ApplicationRecord
  belongs_to :user
  
  with_options presence: true do
    validates :title
    validates :image
    validates :explain
  end

  has_many :comments
  has_one_attached :image
end
