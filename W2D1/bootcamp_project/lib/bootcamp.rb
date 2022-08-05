class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @students = []
    @teachers = []
    @student_capacity = 6
    @grades = Hash.new {|h,k| h[k] = []}
  end

  def name
    @name
  end

  def slogan
    @slogan
  end

  def teachers
    @teachers
  end

  def students
    @students
  end

  def hire(str)
    @teachers << str
  end

  def enroll(str)
    if @students.length < @student_capacity
        @students << str
        return true
    end
    return false
  end

  def enrolled?(str)
    @students.each {|student| return true if student == str}
    return false
  end

  def student_to_teacher_ratio
    return @students.length / @teachers.length
  end


  def add_grade(stu, grade)
    if @students.any?(stu)
      @grades[stu] << grade
      return true
    end
    return false
  end

  def num_grades(student)
    return @grades[student].count
  end

  def average_grade(student)
    return nil if enrolled?(student) == false || @grades[student].length == 0
    return @grades[student].sum / @grades[student].length
  end
end