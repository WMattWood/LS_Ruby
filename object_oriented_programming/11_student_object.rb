class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    grade > other_student.grade
  end

  private

  def grade
    @grade
  end
end

joe = Student.new("Joe", 85)
mark = Student.new("Mark", 64)

puts "yes" if joe.better_grade_than?(mark)
# joe.grade
# mark.grade