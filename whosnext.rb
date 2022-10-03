file = File.open("/Users/kleinyann/students.txt")
students_data = file.read.split('|')
all_students = students_data[0]&.split(',') || ""
remaining_students = students_data[1]&.split(',') || ""

case ARGV[0]
when nil
  remaining_students = all_students if remaining_students.empty?
  student = remaining_students.sample
  remaining_students.delete(student)
  File.open("/Users/kleinyann/students.txt", "w") do |f| 
    f.write all_students.join(",") + "|" + remaining_students.join(",")
  end
  puts "And the next one is... " + student
when "set"
  all_students = ARGV[1].split(',')
  File.open("/Users/kleinyann/students.txt", "w") do |f| 
    f.write all_students.join(",") + "|" + all_students.join(",")
  end

when "reset"
  File.open("/Users/kleinyann/students.txt", "w") do |f| 
    f.write all_students.join(",") + "|" + all_students.join(",")
  end
when "list"
  puts all_students.join(',')
else
  puts "Don't know that command!"
end