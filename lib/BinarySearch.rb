array = [2,5,8,12,16,23,38,56,72,91] # Array de números
key = 16 # Elemento a ser encontrado

# Primeiro passo
# Retornar a metade de um array

def split_array(array, key, start_index, end_index)
  # Receber um array, Dividi-lo e retornar a parte conveniente

  return -1 if start_index > end_index
  #sizeArray = array.length # Pegar o comprimento total
  #halfIndex = (sizeArray / 2) - 1 # Temos aqui o índice do elemento do meio
  half_index = (start_index + end_index) / 2
  if array[half_index] == key
    return half_index
  elsif key < array[half_index]
    split_array(array, key, start_index, half_index - 1)
  else
    split_array(array, key, half_index + 1, end_index)
  end
end

def binarySearch(array, key) 
  split_array(array,key,0,array.length - 1)
end

index = binarySearch(array,key)

puts index

if index == -1
  puts "Não encontrado"
else
  puts "Elemento encontrado no índice #{index}"
end