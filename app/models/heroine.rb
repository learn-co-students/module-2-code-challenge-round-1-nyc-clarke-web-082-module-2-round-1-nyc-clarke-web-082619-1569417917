class Heroine < ApplicationRecord
    belongs_to :power
    validates :super_name, uniqueness: true

    def self.search(power_name)
      if power_name  
        power = Power.find_by(name: power_name)
            if power
                self.where(power_id: power)
            else
                Heroine.all
            end
        else
            Heroine.all
        end
    end
end
