def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
      when "1"
        students = input_students
      when "2"
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit
      else
        puts "I don't understand, please try again"
    end
  end
end


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

    students << {name: name, cohort: :november, age: age, 
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
  acc = 0
  puts "Please enter first letter of names to print them"
  initial = gets.chop 
  print_header
  while acc < students.count
    if students[acc][:name][0] == initial.upcase  
      puts "#{acc + 1}: #{students[acc][:name]}, #{students[acc][:cohort]} cohort".center(100) 
      puts "Age: #{students[acc][:age]}, Height: #{students[acc][:height]} cm, Hobby: #{students[acc][:hobby]}.".center(100)
      puts "---".center(100)
    end
    acc += 1 
  end
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
# nothing happens until we call the methods
interactive_menu