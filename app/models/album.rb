class Album < ApplicationRecord
  validates :band_id, :year, :title, :record_id, presence: true

  belongs_to :band 
end
