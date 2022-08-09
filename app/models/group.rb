class Group < ApplicationRecord
  validates :name, precense: true
  has_one_attached :icon
  validates :icon, precense:true
  belongs_to :user
  has_and_belongs_to_many :deals
end
