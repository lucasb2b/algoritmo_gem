def min_sum(array, number)
  min_val = array.min
  return (min_val * (number - 1))
end

array = [23, 56, 12, 63, 8]
number = array.count
puts min_sum(array, number)