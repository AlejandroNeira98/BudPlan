class Deal < ApplicationRecord
  validates name, ammount, precense: true
  belongs_to :user
  has_and_belongs_to_many :groups
end
