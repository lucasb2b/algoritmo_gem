puts "Bubble Sort"
puts "-----------------"
lista = [18, 7, 55, 23, 1, 12, 57, 85, 42]

def BubbleSort(lista)
  n = lista.length
  troca = true

  while troca
    troca = false
    for i in 0..n-2
      if lista[i] > lista[i + 1]
        lista[i], lista[i + 1] = lista[i + 1], lista[i]
        troca = true
      end
    end
    n -= 1
  end
  
  puts lista
end

BubbleSort(lista)