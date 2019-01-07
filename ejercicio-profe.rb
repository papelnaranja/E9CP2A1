# La mesa tiene que decir cual es y cual fue su mayor income y en que día.
# Instancia = Lego

class Table
attr_accessor :income
  #def initialize(name,day1, day2, day3, day4)
  def initialize(name,*income) # ====> ESTE ES EL CONTRSUCTOR 
    @name = name
    @income = income.map(&:to_i)
    #@income = [ day1, day2, day3, day4 ]
  end
  def best_day
    day = @income.index(@income.max) + 1
    "El mejor de la #{@name} fue #{day.to_s} con #{@income.max}"
  end
  def avg
    @income.sum/@income.length
  end
end

data = File.open('casino.txt','r'){|file| file.readlines }
#print data
table_objects = []
data.each do |table_string|
    table_array = table_string.split(', ').map(&:chomp)
    # .map(&:chomp) = shortcode de table_string.map {|elemen| element.chomp}, los & son procedimientos.
    #table_array = table_string.split(',').map(&:strip) 
    #strip quita el espacio.
    table_objects << Table.new(*table_array)
    # table_obj << Table.new(table_array[0],table_array[1], table_array[2], table_array[3], table_array[4])
    #El metodo .new llama el initialize
end
avarage = []
table_objects.each do |table|
    table.income.each_with_index do |value, index|
        avarage[index] = [] if avarage[index] == nil
        # crea un array vacio (dentro de uno vacio)
        avarage << value
    end
    puts  table.best_day   
    puts "El promedio es #{table.avg}"
end
avg_day = []
avarage.each do |x|
    avg_day << x.sum/avarage.length
end
p avg_day


# concepto tdd = desarrollo guiado por pruebas ( usar el código que desareamos tener )
