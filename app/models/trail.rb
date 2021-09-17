class Trail < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true 

  before_validation :sanitize_name!

  private
    def sanitize_name!
      self.name = self.name.to_s.downcase
    end 
end
