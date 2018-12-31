def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp.capitalize
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :November}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp.capitalize
  end
  # return to the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  acc = 0
  while acc < students.count
    puts "#{acc + 1}: #{students[acc][:name]} (#{students[acc][:cohort]} cohort)"
    acc += 1
  end  
end

def print_by_initial(students)
  puts "Return names by first initial"
  initial = gets.chomp
  students.each_with_index {|student, index|
  if student[:name][0] == initial.upcase  
    puts "#{index + 1}: #{student[:name]} (#{student[:cohort]} cohort)"
  end
}
end
def print_if_less_than_12(students)
  students.each_with_index {|student, index|
    if student[:name].length <= 12 
      puts "#{index + 1}: #{student[:name]} (#{student[:cohort]} cohort)"
    end
  }
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students."
end
# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)