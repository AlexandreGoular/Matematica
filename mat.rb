#Exercício 1: Tratamento de Erros em Operações Matemáticas
#Crie um programa que peça ao usuário para inserir dois números e uma operação matemática (+, -, *, /). Implemente o tratamento de exceções para lidar com erros como divisão por zero ou operação inválida.

class Erro < StandardError
end

class Msg < StandardError
end

#%w cria um array com esses operadores dentro
def operacao_valida?(operador)
  %w(+ - * /).include?(operador)
end

imprimir_resultado = true  # Variável de controle para imprimir o resultado apenas uma vez

loop do
  begin
    n1, n2 = nil, nil

    #Aqui ele verifica se n1 e n2 é par ou Impar
    until (n1&.odd? || n2&.odd?) && (n1&.even? || n2&.even?)
      puts "Digite o primeiro número:"
      n1 = gets.chomp.to_i
      puts "Digite o segundo número:"
      n2 = gets.chomp.to_i

      #Caso os numeros digitados nao seja par ou Impar ele aparece essa msg
      raise Msg, "Pelo menos um dos números deve ser ímpar ou par." unless (n1&.odd? || n2&.odd?) && (n1&.even? || n2&.even?)
    end

    puts "Digite a Operação (+, -, *, /)"
    operador = gets.chomp

    #Verifica se a opção digitada acima é valida
    raise Erro, "Operação Inválida" unless operacao_valida?(operador)

    resultado = case operador
                when "+"
                  n1 + n2
                when "-"
                  n1 - n2
                when "*"
                  raise Erro, "Multiplicação por Zero é 0" if n1.zero? || n2.zero?
                  n1 * n2
                when "/"
                  raise Erro, "Divisão por 0 é 0" if n2.zero? || n1.zero?
                  n1 / n2
                end

    puts "O resultado é: #{resultado}"

     #Depois que é imprimido o resultado imprimir_resultado fica false
    imprimir_resultado = false

  rescue Erro, Msg => e
    puts "Erro: #{e.message}"
  end
  # Para o loop se imprimir_resultado for falso
  break unless imprimir_resultado
end
