class Power < ApplicationRecord
    validates :name, uniqueness: true
    validates :name, presence: true
    validates :description, presence: true
    has_many :heroines
end
