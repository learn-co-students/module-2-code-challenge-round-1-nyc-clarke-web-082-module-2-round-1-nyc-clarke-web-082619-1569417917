class Heroine < ApplicationRecord
    belongs_to :power
    validates :super_name, uniqueness: true
    
    def self.search(search_result)
    heroines = if search_result
        heroines = find_heroines(search_result)
      else
        heroines = all
      end
    end

    def self.find_heroines(search_result) # returns heroines based on search
        all.select { |heroine| Power.find(heroine.power_id).name == search_result }
    end
end
