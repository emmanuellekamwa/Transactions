class Group < ApplicationRecord
  validates :name, presence: true, length: { in: 4..50 },
                   uniqueness: true

  has_many :transactions
  belongs_to :user

  scope :in_u_g, -> { includes(:user, :group) }
  scope :dsc, -> { order('created_at DESC') }
end
