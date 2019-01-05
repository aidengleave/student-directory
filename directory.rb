def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  cohorts = [:November, :December, :January, :February, :March]
  name = gets.chop.capitalize
     
  while !name.empty? do
    puts "Enter student's cohort (November to March)"
    cohort = gets.chop.capitalize
    cohort = cohorts.include?(cohort.to_sym) ? cohort : :undef
          
    while cohort == :undef do
      puts "Please check your input for mistakes (November to March)"
      cohort = gets.chop.capitalize
      cohort = cohorts.include?(cohort.to_sym) ? cohort : :undef
    end
    puts "Enter student's age"
    age = gets.chomp
    puts "Enter student's favourite hobby"
    hobby = gets.chomp
  
    #add the student hash to the array
  
    students << {name: name, cohort: cohort, age: age, hobby: hobby}
      
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
      # get another name from the user
      name = gets.chop.capitalize
  end
  # return to the array of students
  students
end
  
def print_by_month(students)
  puts "enter cohort month to print students"
  month = gets.chomp.capitalize
  
  print_header
  puts "#{month} Cohort".center(100)
  
  students.map.with_index { |student, index| if student[:cohort] == month 
    puts"#{index + 1}: #{student[:name]}".center(100),
    "They are #{student[:age]} years old, and their favourite hobby is #{student[:hobby]}.".center(100) end }
end
  
def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end
  
def print_footer(students)
  if students.count == 1
    puts "Overall, we have #{students.count} great student."
  else
    puts "Overall, we have #{students.count} great students."
  end
end

# nothing happens until we call the method
students = input_students
print_by_month(students)
print_footer(students)