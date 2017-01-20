require "csv"

def csv_to_hash
  #Creates a method that converts a csv table to usable hashes.
  #NOTE: The default layout takes the FIRST ROW of the CSV,
  #  and uses it to automatically apply labels for all the hashes.
  #  Then all the hashes are stored in total_hash.
  #  Remember these rules:
  #  1) The FIRST item of each row will be the key for the total hash
  #  2) The labels in the FIRST row of the CSV file, will be the keys
  #     inside the inner hash.
  #  EX:  Let's say "Name" is the first column label.
  #     total_hash[:Swarthmore] will give you a hash with all of Swarthmore's data
  #     total_hash[:Swarthmore][:Name] will return the string "Swarthmore"

  arr_of_arrs = CSV.read("./file.csv")
  #NOTE: Replace "file.csv" with the filename of your document!
  labels = arr_of_arrs[0]
  total_hash = {}
  arr_of_arrs[1..-1].each do |arr|
    total_hash[arr[0].to_sym] = Hash[arr.map.with_index {|item, index| [labels[index].to_sym, item]}]
  end
  return total_hash
end

###The Code below demonstrates its usage, using a demo csv file

school_hash = csv_to_hash
puts school_hash
#Displays the total_hash including a separate hash for each row in the CSV File

puts school_hash["Princeton University".to_sym]
#Displays the Princeton Hash

puts school_hash["Princeton University".to_sym][:ACT]
#Displays the ACT score range for Princeton Universitys






