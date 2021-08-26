# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#

refactoring_approach = <<-EOF
 we can refactoring this triangle method
 to use a different approach, here is my second suggestion

 def triangle_type
  {
    1 => :equilateral,
    2 => :isosceles,
    3 => :scalene
  }
 end

 def triangle(a,b,c)
  triangle_type[[a,b,c].uniq.size]
 end
EOF

def triangle(a, b, c)
  @values = a, b, c

  raise TriangleError if out_of_triangle_range?

  return :equilateral if equilateral?
  return :isosceles if isosceles?

  :scalene if scalene?
end

puts refactoring_approach

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end

def out_of_triangle_range?
  some_negative_value? || some_zero? || invalid_triangle_size?
end

def scalene?
  @values.uniq.length == 3
end

def isosceles?
  @values.uniq.length == 2
end

def equilateral?
  @values.uniq.length == 1
end

def some_negative_value?
  @values.any?(&:negative?)
end

def some_zero?
  @values.any?(&:zero?)
end

def invalid_triangle_size?
  !@values.filter do |value|
    value >= @values.sum - value
  end.empty?
end
