require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter][:christmas].push(supply)
  holiday_hash[:winter][:new_years].push(supply)
  holiday_hash
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day].push(supply)
  holiday_hash
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = []
  supply_array.each do |thing|
    holiday_hash[season][holiday_name].push(thing)
  end
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  blank_array = []
  holiday_hash[:winter].collect do |holiday, supply_list|
    supply_list.collect do |supply|
      blank_array.push(supply)
    end
  end
  blank_array

end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.

  holiday_hash.keys.each do |season|
    puts season.to_s.capitalize + ":"
    holiday_hash[season].keys.each do |holy_day|
      thing = holy_day.to_s.split("_").map do |word|
        word.capitalize
      end
      puts "  " + thing.join(" ") + ": " + holiday_hash[season][holy_day].join(", ")
    end
  end
    


end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  list = []
  holiday_hash.keys.each do |season|
    holiday_hash[season].keys.each do |holy_day|
      holiday_hash[season][holy_day].each do |thing|
        if thing == "BBQ"
          list.push(holy_day)
        end
      end
    end
  end
  list
end







