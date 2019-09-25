class Heroine < ApplicationRecord
    belongs_to :power

    validates :super_name, uniqueness: true

    def self.filtered_by_power(power_name)
        self.all.select do |heroine|
            if heroine.power.name.casecmp(power_name) == 0
                true
            else
                false
            end
        end
    end
end
