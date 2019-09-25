class Heroine < ApplicationRecord
    validates :name, :super_name, presence: true
    validates :super_name, uniqueness: true
    belongs_to :power
end
