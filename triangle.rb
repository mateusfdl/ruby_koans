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
    3 => scalene
  }
 ENd

 def triangle(a,b,c)
  triangle_type[[a,b,c].uniq.size]
 end
EOF

def triangle(a, b, c)
  return :equilateral if equilateral? a,b,c 
  return :isosceles if isosceles? a,b,c
  :scalene if scalene? a,b,c
end


# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end

def scalene?(a,b,c)
  [a,b,c].uniq.length == 3
end

def isosceles?(a,b,c)
  [a,b,c].uniq.length == 2
end

def equilateral?(a,b,c)
  [a,b,c].uniq.length == 1
end
