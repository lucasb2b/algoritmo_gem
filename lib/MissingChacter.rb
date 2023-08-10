require 'set'

def missing_character(phrase = 0)
  alphabet = ('a'..'z').to_a
  downcase_string = phrase.downcase
  phrase_sanitize = downcase_string.gsub(/[\s,\.]/, '')
  array_letter = phrase_sanitize.chars

  # Criando um conjunto com todas as letras do alfabeto
  alphabet_set = Set.new(alphabet)

  # Removendo as letras da frase do conjunto
  array_letter.each do |letter|
    alphabet_set.delete(letter)
  end

  # Convertendo o conjunto de letras ausentes para um array
  letters_missing = alphabet_set.to_a

  # Exibindo as letras ausentes em um puts
  puts "Letras ausentes na frase:"
  puts letters_missing.join(', ')

  # Retorna a quantidade de letras ausentes
  return letters_missing.size

end

ok = missing_character("Eu sou o melhor dos mundos")
puts "Quantidade de letras ausentes: #{ok}"