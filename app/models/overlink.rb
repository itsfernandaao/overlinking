class Overlink < ApplicationRecord
  belongs_to :trail

  validates :url, presence: true
end
