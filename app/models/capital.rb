class Capital < ActiveRecord::Base

  validates :name, presence: true, length: {maximum: 150}, uniqueness: { case_sensitive: false }

end
