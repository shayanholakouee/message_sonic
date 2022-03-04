class Message < ApplicationRecord
    validates :body , presence: true
    belongs_to :user
    scope :latest_messages, -> { order(:created_at).last(20) }
end
