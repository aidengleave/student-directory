# this program prints its own source code
puts File.read(__FILE__)
puts "The file name is #{$0}"