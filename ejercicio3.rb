## Ejercicio 3: Ruleta.

# Se tiene un array que contiene los números de una ruleta.

# ~~~
# r = (1..10).to_a
# ~~~

# Se pide:

# - Crear una clase llamada *Roulette*.

# - Crear un método de instancia llamado *play* que reciba como argumento un número al cual se está apostando. Luego debe tomar un valor -del array- al azar y compararlo con el número al cual se apostó.

# - Crear un método de instancia que:

#     - Debe almacenar el número generado al azar en un archivo llamado *roulette_history.txt*

#     - Si el número al cual se apostó **corresponde** al generado al azar entonces, debe además almacenar ese número en un archivo llamado *winners.txt*

# - Crear un método que lea el archivo *rouletter_history.txt* y retorne el valor que más ha generado la ruleta históricamente.



class Roulette
    def initialize
        @r = (1..10).to_a
    end
    def play(num)
        @random_num = @r.sample
        @selected = @random_num == num
    end
    def roulette_data
        file = File.open('roulette_history.txt', 'a')
        file.puts @random_num
        file.close
        winner_file = File.open('winners.txt', 'a')
        if @selected == true
            winner_file.puts @random_num
        end
        winner_file.close
    end
    def most_selected
        file = File.open('roulette_history.txt', 'r')
        data = file.readlines.map(&:chomp)
        data_i = data.map {|i| i.to_i}
        file.close
        # saca la frecuencia
        freq = data_i.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
        data_i.max_by { |v| freq[v] }
    end
end

a = Roulette.new
a.play(5)
a.roulette_data
puts a.most_selected

