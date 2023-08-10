# Algoritmo de Counting Sort em Ruby
def counting_sort(array)
  # Etapa 1: Encontrar o valor máximo e mínimo do array
  max_val = array[0]
  min_val = array[0]

  array.each do |num|
    max_val = num if num > max_val
    min_val = num if num < min_val
  end

  # Etapa 2: Criar o array de contagem
  range = max_val - min_val + 1
  count_arr = Array.new(range, 0)

  # Etapa 3: Contar as ocorrências dos elementos
  array.each do |num|
    count_arr[num - min_val] += 1
  end

  # Etapa 4: Calcular as posições finais no array ordenado
  (1...range).each do |i|
    count_arr[i] += count_arr[i - 1]
  end

  # Etapa 5: Construir a lista ordenada
  sorted_arr = Array.new(array.length)
  array.reverse_each do |num|
    sorted_arr[count_arr[num - min_val] - 1] = num
    count_arr[num - min_val] -= 1
  end

  return sorted_arr
end

# Teste com um array de exemplo
array = [8,8,2,3,2,4,6,8,6,7,2,3,5,7,9]
puts "Array original: #{array}"
sorted_arr = counting_sort(array)
puts "Array ordenado: #{sorted_arr.join(', ')}"
