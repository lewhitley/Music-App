class Track < ActiveRecord::Base
  validates :album_id, :song, presence: true

  belongs_to :album
  has_many :notes
end
