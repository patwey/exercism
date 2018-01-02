class School
  def initialize
    @roster = Hash.new { |h, k| h[k] = [] }
  end

  def students(grade)
    @roster[grade].sort
  end

  def add(name, grade)
    @roster[grade] << name
  end

  def students_by_grade
    @roster.to_a
           .sort
           .map { |grade, names| { grade: grade, students: names.sort } }
  end
end

module BookKeeping
  VERSION = 3
end
