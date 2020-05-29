class User < ApplicationRecord
  has_many :event_creator,
    class_name: 'Event',
    foreign_key: 'creator_id'

  has_many :events, through: :attendances
end
