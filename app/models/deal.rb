class Deal < ApplicationRecord
  validates :name, :ammount, precense: true
  belongs_to :user
  has_and_belongs_to_many :groups
  validate :has_group

  def has_group
    errors.add(:base, 'must add at least one category') if self.groups.empty?
  end
end
