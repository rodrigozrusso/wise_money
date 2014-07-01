class Capital < ActiveRecord::Base

  validates :name, presence: true, length: {maximum: 150}, uniqueness: { case_sensitive: false }

  def to_s
    "#{id} - #{name}"
  end

end
