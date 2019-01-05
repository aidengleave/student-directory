@students = []

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    @students = input_students
  when "2"
    print_header
    print_student_list
    print_footer
  when "3"
    save_students
    "puts student"
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't understand, please try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  cohorts = [:November, :December, :January, :February, :March]
  # get the first name
  name = STDIN.gets.chop.capitalize
  #while the name is not empty, repeat this code
   
  while !name.empty? do
    puts "Enter student's cohort (November to March)"
    cohort = STDIN.gets.chop.capitalize
    cohort = cohorts.include?(cohort.to_sym) ? cohort : :undef
        
    while cohort == :undef do
      puts "Please check your input for mistakes (November to March)"
      cohort = STDIN.gets.chop.capitalize
      cohort = cohorts.include?(cohort.to_sym) ? cohort : :undef
    end

    puts "Please enter student's age"
    age = STDIN.gets.chop
    puts "Please enter student's hobby"
    hobby = STDIN.gets.chop

    #add the student hash to the array

    students_hash_to_array(name, cohort, age, hobby)
    
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    # get another name from the user
    name = STDIN.gets.chop.capitalize
  end
  # return to the array of students
  @students
end

def students_hash_to_array(name, cohort, age, hobby)
  @students << {name: name, cohort: cohort, 
  age: age, hobby: hobby}
end 

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:age], student[:hobby]]
    csv_line =student_data.join(",")
    file.puts csv_line
  end
  file.close 
  puts "Students saved to file"
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort, age, height, hobby = line.chomp.split(",")
  students_hash_to_array(name, cohort.to_sym, age, hobby)
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}."
  else
    puts "Sorry #{filename} doesn't exist."
    exit
  end
end

def print_student_list 
  acc = 0
  while acc < @students.count
    puts "#{acc + 1}: #{@students[acc][:name]}, #{@students[acc][:cohort]} cohort".center(100) 
    puts "Age: #{@students[acc][:age]}, Height: #{@students[acc][:height]} cm, Hobby: #{@students[acc][:hobby]}.".center(100)
    puts "---".center(100)
    acc += 1 
  end
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print_footer
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student.".center(100)
  else
    puts "Overall, we have #{@students.count} great students.".center(100)
  end
end
# nothing happens until we call the methods
try_load_students
interactive_menu