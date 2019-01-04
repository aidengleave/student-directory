def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  cohorts = [:November, :December, :January, :February, :March]
  # get the first name
  name = gets.chop.capitalize
  #while the name is not empty, repeat this code
     
  while !name.empty? do
    puts "Enter student's cohort (November to March)"
    cohort = gets.chop.capitalize
    cohort = cohorts.include?(cohort.to_sym) ? cohort : :undef
          
    while cohort == :undef do
      puts "Please check your input for mistakes (November to March)"
      cohort = gets.chop.capitalize
      cohort = cohorts.include?(cohort.to_sym) ? cohort : :undef
    end
  
    puts "Please enter student's age"
    age = gets.chop
    puts "Please enter student's height in cm"
    height = gets.chop
    puts "Please enter student's hobby"
    hobby = gets.chop
  
    #add the student hash to the array
  
    students << {name: name, cohort: cohort, age: age, 
    height: height, hobby: hobby}
      
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
  
def print(students)
  students.sort_by! {|student| student[:cohort]}
    students.each_with_index {|student, index| 
    puts "#{student[:cohort]}".center(100).center(100)
    puts"#{index + 1}: #{student[:name]}, Age: #{student[:age]}".center(100)
    puts "Height: #{student[:height]}, Hobby: #{student[:hobby]}".center(100)}
end
  
  def print_header
    puts "The students of Villains Academy".center(100)
    puts "-------------".center(100)
  end
  
  def print_footer(students)
    if students.count == 1
      puts "Overall, we have #{students.count} great student.".center(100)
    else
      puts "Overall, we have #{students.count} great students.".center(100)
    end
  end
  # nothing happens until we call the method
  students = input_students
  print_header
  print(students)
  print_footer(students)