class Triangle
  attr_accessor :length1, :length2, :length3
  def initialize(length1, length2, length3)
    @length1 = length1
    @length2 = length2
    @length3 = length3
  end

  def valid?
    length1 > 0 && length2 > 0 && length3 > 0
    length1 + length2 > length3 && length2 + length3 > length1 && length3 + length1 > length2
  end

  def kind
    if self.valid?
      if length1 == length2 && length2 == length3
        :equilateral
      elsif length1 != length2 && length2 != length3 && length3 != length1
        :scalene
      else length1 == length2 ||length2 == length3 || length3 ==length1
        :isosceles
      end
    else
      raise TriangleError
    end 
  end

  class TriangleError < StandardError
    def message
      "Not a valid triangle."
    end
  end
end
