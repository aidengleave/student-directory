def input_students
  puts "Please enter the names of the students".center(100)
  puts "To finish, just hit return twice".center(100)
  # create an empty array
  students = []
  cohorts = [:November, :December, :January, :February, :March]
  # get the first name
  name = gets.chop.capitalize
  #while the name is not empty, repeat this code  
    if !name.empty? 
      puts "Enter student's cohort (November to March)".center(100)
      cohort = gets.chop.capitalize
      cohort = cohorts.include?(cohort.to_sym) ? cohort : :undef
      #if cohort == "Unknown"
        while cohort == :undef do
          puts "Please check your input for mistakes (November to March)".center(100)
          cohort = gets.chop.capitalize
          cohort = cohorts.include?(cohort.to_sym) ? cohort : :undef
        end
      #add the student hash to the array
      puts "Please enter student's age".center(100)
      age = gets.chop
      puts "Please enter student's height in cm".center(100)
      height = gets.chop
      puts "Please enter student's hobby".center(100)
      hobby = gets.chop
      students << {name: name, cohort: cohort, age: age, 
      height: height, hobby: hobby}
    
      if students.count == 1
        puts "Now we have #{students.count} student".center(100)
      else
        puts "Now we have #{students.count} students".center(100)
      end

      puts "Please enter another name or press return".center(100)
      # get another name from the user
      name = gets.chop.capitalize
    
    else
      print_footer(students)
      exit
    end
  # return to the array of students
  students
end

def print(students)  
  acc = 0
  puts "Please enter first letter of names to print them".center(100)
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
students = input_students
print(students)
print_footer(students)