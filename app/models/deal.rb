class Deal < ApplicationRecord
  validates :name, :ammount, precense: true
  belongs_to :user
  has_and_belongs_to_many :groups
  validate :group?

  def group?
    errors.add(:base, 'must add at least one category') if groups.empty?
  end
end
