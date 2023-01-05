module Enumerable
  # Your code goes here
  def my_each_with_index()
    i = 0

    for element in self
      yield element, i
      i += 1
    end
  end

  def my_select()
    filtered_array = []
    for element in self
      filtered_array.push element if yield element
    end
    return filtered_array
  end

  def my_all?()
    for element in self
      return false unless yield element
    end
    return true
  end

  def my_any?()
    for element in self
      return true if yield element
    end
    return false
  end

  def my_none?()
    for element in self
      return false if yield element
    end
    return true
  end

  def my_count()
    return self.length unless block_given?

    count = 0
    for element in self
      count += 1 if yield element
    end
    count
  end

  def my_map()
    new_array = []
    for element in self
      new_array.push (yield element)
    end
    new_array
  end

  def my_inject(current_value)
    for element in self
      current_value =  yield current_value, element
    end
    current_value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each()
    for element in self
      yield element
    end
  end
end