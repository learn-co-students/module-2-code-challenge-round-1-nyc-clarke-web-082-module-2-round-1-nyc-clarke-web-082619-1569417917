class Heroine < ApplicationRecord
    belongs_to :power
    validates :super_name, uniqueness: {case_sensitive: false}
end
