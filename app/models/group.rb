# frozen_string_literal: true

class Group < ApplicationRecord
  validates :name, presence: true
  has_one_attached :icon
  validates :icon, attached: true
  belongs_to :user
  has_and_belongs_to_many :deals
end
