class Room < ApplicationRecord
  belongs_to :user
  has_many :photos

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :home_type, presence: true
  validates :room_type, presence: true
  validates :accommodate, presence: true
  validates :bed_room, presence: true
  validates :bath_room, presence: true

  def cover_photo(size)
    #show if photos exist 
    if self.photos.length > 0
      self.photos[0].image.url(size)
    else
      #show default photo is not exist anyone
      "blank.png"
    end
  end
  
end
