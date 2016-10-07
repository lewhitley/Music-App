class Album < ActiveRecord::Base
  validates :band_id, :title, :recording, presence: true

  has_many :tracks
  belongs_to :band
end
