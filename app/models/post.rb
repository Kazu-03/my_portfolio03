class Post < ApplicationRecord
  validates :title,     presence: true, length: { maximum: 80 }
  validates :overview,  presence: true, length: { maximum: 500 }
  validates :target,    presence: true, length: { maximum: 100 }
  validates :manner,    presence: true, length: { maximum: 100 }
  validates :reward,    presence: true, length: { maximum: 100 }

end
