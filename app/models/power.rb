class Power < ApplicationRecord
    validates :name, :description, presence: true
    has_many :heroines
end
