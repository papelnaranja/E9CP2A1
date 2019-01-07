
# - Crear una clase *Table* cuyo constructor reciba el nombre de la mesa y las recaudaciones correspondientes de cada día.

# - Crear un método que permita leer el archivo e **instanciar un objeto de la clase *Table* por cada línea del archivo**.

# - Crear métodos que permitan:

# - Conocer el **mayor** valor recaudado, por mesa, y el nombre de la mesa y día corresponde (día 1, día 2, día 3 o día 4).

# - Calcular el promedio total de lo recaudado por todas las mesas en todos los días.






class Table
    attr_accessor :name, :income, :day
    def initialize(name, *income)
        @name = name
        @income = income.map(&:to_i)
    end
    def best_day
        @day = @income.index(@income.max) + 1
        # "El mejor de día la #{@name} fue #{day.to_s} con #{@income.max}"
    end
    def avg
        @income.sum/@income.length
    end
end


#Crear un método que permita leer el archivo e **instanciar un objeto de la clase *Table* por cada línea del archivo**.



def make_objet_for_line
    file = File.open('casino.txt', 'r')
    data = file.readlines
    file.close
    table_objects = []
    data.each do |table_string|
        table_array = table_string.split(', ').map(&:chomp)
        table_objects << Table.new(*table_array)
    end
    return table_objects
end

table_objects = make_objet_for_line()


def best_day_of_array(table_objects)
    table_objects.each do |table| 
        puts "El mejor de día la #{table.name} fue #{table.day.to_s} con #{table.income.max}"  
    end
end

best_day_of_array(table_objects)

def all_avg(table_objects)
    tables_avg = []
    table_objects.each do |table|
       tables_avg << table.avg
    end
    puts all = tables_avg.sum/tables_avg.length    
end

all_avg(table_objects)