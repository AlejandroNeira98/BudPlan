class Deal < ApplicationRecord
  validate :name?
  validate :amount?
  belongs_to :user
  has_and_belongs_to_many :groups
  validate :group?

  def group?
    errors.add(:base, 'must add at least one category') if groups.empty?
  end
  
  def name?
    errors.add(:base, 'must have name') if name.nil?
  end

  def amount?
    errors.add(:base, 'must have amount') if amount.nil?
  end
end
