class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments
  
  def self.search(search)
    if search
      where("title ILIKE ?", "%#{search}%")
    else
      where
    end
  end
end