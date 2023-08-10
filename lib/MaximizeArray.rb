def maximize_array(array, k)
  # Ordenar o array do menor ao maior
  sort_array = array.sort
  sum = 0
  i = 0

  while k > 0
    if (sort_array[i] >= 0)
      k = 0
    else
      sort_array[i] = (-1) * sort_array[i]
     k -= 1
    end
    i += 1
  end

  sort_array.each do |j|
    sum += j
  end
  
  return sum
  
end

array = [-2,0,5,-1,2]
puts maximize_array(array,4)