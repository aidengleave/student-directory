def input_students
  puts "Please enter the names of the students".center(100)
  puts "To finish, just hit return twice".center(100)
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp.capitalize
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    puts "Please enter student's age".center(100)
    age = gets.chomp
    puts "Please enter student's height in cm".center(100)
    height = gets.chomp
    puts "Please enter student's hobby".center(100)
    hobby = gets.chomp
    students << {name: name, cohort: :November, age: age, 
    height: height, hobby: hobby}
    puts "Now we have #{students.count} students".center(100)
    # get another name from the user
    name = gets.chomp.capitalize
  end
  # return to the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print(students) 
  #Prints students by first initial if their name is less than 12 characters
  acc = 0
  #puts "Return names by first initial"
  #initial = gets.chomp
  while acc < students.count
    #if students[acc][:name][0] == initial.upcase && students[acc][:name].length <= 12  
    puts "#{acc + 1}: #{students[acc][:name]}, #{students[acc][:cohort]} cohort, Age: #{students[acc][:age]}, Height: #{students[acc][:height]} cm, Hobby: #{students[acc][:hobby]}".center(100)
    #end
    acc += 1
  end  
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students.".center(100)
end
# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)