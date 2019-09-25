class Heroine < ApplicationRecord
    validates :super_name, uniqueness: true
    validates :super_name, presence: true
    belongs_to :power
end
