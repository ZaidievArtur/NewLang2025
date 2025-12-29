let rec gcd a b =
    Printf.printf "Вызов: a = %-3d, b = %-3d\n" a b;
  
  match b with
  | 0 -> 
      Printf.printf "  -> Базовый случай достигнут! Результат: %d\n" a;
      a
  | _ -> 
      let next_a = b in
      let next_b = a mod b in
      Printf.printf "  -> Вычисляем остаток: %d mod %d = %d\n" a b next_b;
      gcd next_a next_b


let () =
  print_endline "--- Запуск алгоритма Евклида ---";
  let x, y = 1071, 462 in
  let result = gcd x y in
  Printf.printf "--- Итог: НОД(%d, %d) = %d ---\n" x y result