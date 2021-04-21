class User < ApplicationRecord
  before_save { self.name = name.camelize }

  validates :name, presence: true, length: { in: 4..50 },
                   uniqueness: true

  has_many :groups
  has_many :transactions
end
