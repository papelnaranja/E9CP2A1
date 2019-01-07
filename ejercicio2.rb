## Ejercicio 2: Objetos y archivos.

# El archivo *cursos.txt* contiene las fechas de inicio y término de cursos dictados por Desafío Latam durante el año 2017, con la siguiente estructura:

# ~~~
# Front-end, 2017-05-21, 2017-08-10
# Wordpress, 2017-04-12, 2017-11-04
# Full-stack, 2017-07-09, 2017-12-29
# Android, 2017-05-17, 2017-08-13
# Marketing, 2017-03-14, 2017-10-20
# ~~~

# Se pide:

# - Crear una clase *Course* cuyo constructor reciba el nombre del curso y las fechas de inicio y término.

# - Crear un método que permita leer el archivo y **crear una instancia de la clase Course por línea del archivo**.

# - Crear métodos que permitan:

# - Saber qué cursos comienzan previo a una fecha entregada como argumento.

#     - Saber qué cursos finalizan posterior a una fecha entregada como argumento.

# > En ambos el métodos argumento por defecto debe ser la fecha de hoy.

# > Ambos métodos deben levantar una excepción si la fecha recibida es >= 2018-01-01.

require 'date'

class Course
    attr_accessor :course_name, :course_start , :course_end
    def initialize(course_name, course_start, course_end)
        @course_name = course_name
        @course_start = Date.parse(course_start)
        @course_end = Date.parse(course_end)
    end
end



def read_file(filename)
    course_objets = []
    file = File.open(filename, 'r')
    data = file.readlines
    data.each do |course_string|
        course_array = course_string.split(', ').map(&:chomp)
        course_objets << Course.new(*course_array)
    end
    file.close
    return course_objets
end


all_courses_array = read_file('cursos.txt')


def start_before_date(all_courses_array, chosen_date = Date.today)
    parse_date = Date.parse(chosen_date)
    raise 'notThisYearError' if parse_date >= Date.parse('2018-01-01')
    selected_dates = []
    all_courses_array.each do |start_date|
        if start_date.course_start < parse_date 
            hash_course = {}
            hash_course[:name] = start_date.course_name
            hash_course[:date] = start_date.course_start.to_s
            selected_dates << hash_course
        end
    end
end




def finish_after_date(all_courses_array, chosen_date = Date.today)
    parse_date = Date.parse(chosen_date)
    raise 'notThisYearError' if parse_date >= Date.parse('2018-01-01')
    selected_dates = []
    all_courses_array.each do |finish_date|
        if finish_date.course_end < parse_date 
            hash_course = {}
            hash_course[:name] = finish_date.course_end
            hash_course[:date] = finish_date.course_end.to_s
            selected_dates << hash_course
        end
    end
  p selected_dates
end






finish_after_date(all_courses_array,'2017-12-20')

start_before_date(all_courses_array,'2017-12-20')