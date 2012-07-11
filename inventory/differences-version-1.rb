unless ARGV.length == 2
  puts "Usage: differences.rb old-inventory new_inventory"
exit
end
# == is equivilant to equals to

def boring?(line)
 line.split('/').include?('temp') or
  line.split('/').include?('recycler')
end

def inventory_from(filename)
 inventory = File.open(filename)
  downcased = inventory.collect do |line|
  line.downcased
end
downcased.reject do |line|
 boring?(line)
 end
end

old_inventory = File.open(ARGV[0]).collect do |line|
line.downcase
end

new_inventory = File.open(ARGV[1]).collect do |line|
line.downcase
end

ARGV.collect do |element|
puts "you have used file:" + element
end

old_inventory = File.open(ARGV[0]).readlines
new_inventory = File.open(ARGV[1]).readlines

puts "the following files have been added:".inspect
puts new_inventory - old_inventory

puts "the following files have been removed:".inspect
puts old_inventory - new_inventory

number_of_files = (new_inventory - old_inventory).length
puts "You have number of files"
puts number_of_files

number_of_files_added = File.open('old-inventory.txt').readlines
puts "You have added the following files to old_inventory:"
puts number_of_files_added
