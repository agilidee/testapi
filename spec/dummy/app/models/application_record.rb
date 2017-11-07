class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.last_created
    reorder(:created_at, :id).last
  end
end
