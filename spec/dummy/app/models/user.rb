class User < ApplicationRecord
  validates :name,  presence: true
  validates :email, presence: true

  default_scope -> {
    order(:id)
  }
end
