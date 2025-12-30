println("--- СТАРТ ПРОГРАММЫ ---")

data = [1.5, 2.7, 3.2, 4.9]
println("1. Оригинал (", typeof(data), "): ", data)


integers = Int64.(floor.(data)) 
println("2. Целые числа (Broadcasting): ", integers)

rounded = [round(Int, x) for x in data]
println("3. Округление (Comprehension): ", rounded)

println("--- ЗАВЕРШЕНО ---")