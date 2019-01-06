require 'CSV'

@students = []
@cohorts = [:November, :December, :January, :February, :March]

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
  name = STDIN.gets.chop.capitalize
  #while the name is not empty, repeat this code
  while !name.empty? do
    puts "Enter student's cohort (November to March)"
    cohort = STDIN.gets.chop.capitalize
    cohort = @cohorts.include?(cohort.to_sym) ? cohort : :undef
    while cohort == :undef do
      puts "Please check your input for mistakes (November to March)"
      cohort = STDIN.gets.chop.capitalize
      cohort = @cohorts.include?(cohort.to_sym) ? cohort : :undef
    end
    puts "Please enter student's age"
    age = STDIN.gets.chop
    puts "Please enter student's hobby"
    hobby = STDIN.gets.chop
    #add the student hash to the array
    students_hash_to_array(name, cohort, age, hobby)
    puts "Now we have #{@students.count} student#{plural}"
    puts "Enter another student or press return for menu"
    name = STDIN.gets.chop.capitalize
  end
  @students
end

def students_hash_to_array(name, cohort, age, hobby)
  @students << {name: name, cohort: cohort, 
  age: age, hobby: hobby}
end 

def save_students
  puts "Please enter filename"
  filename = gets.chomp
  CSV.open(filename, "w"){|file|
  # iterate over the array of students
  @students.each {|student| file << [student[:name], student[:cohort], 
  student[:age], student[:hobby]]}}
  puts "Students saved to file".center(100)
end

def load_students
  puts "Please enter filename"
  filename = gets.chomp
  CSV.foreach(filename){|line|
  name, cohort, age, height, hobby = line
  students_hash_to_array(name, cohort.to_sym, age, hobby)}
  puts "Students loaded from file".center(100)
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil? # get out of the method if it isn't given
    filename = "students.csv"
    load_students
  elsif File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}."
  else
    puts "Sorry #{filename} doesn't exist."
    exit
  end
end

def print_student_list 
  @students.each_with_index {|student, index|
    puts "#{index + 1}: #{student[:name]}, #{student[:cohort]} cohort".center(100) 
    puts "Age: #{student[:age]}, Hobby: #{student[:hobby]}.".center(100)
    puts "---".center(100)}
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def plural
  if @students.count == 1 
    return ""
  else
    return "s"
  end 
end

def print_footer
  puts "Overall, we have #{@students.count} great student#{plural}.".center(100)
end
# nothing happens until we call the methods
try_load_students
interactive_menu