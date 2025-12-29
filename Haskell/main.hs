-- Функция quicksort принимает список элементов, которые можно сравнивать (Ord a)
-- И возвращает отсортированный список того же типа.
quicksort :: (Ord a) => [a] -> [a]
-- Базовый случай: пустой список уже отсортирован
quicksort [] = []
-- Рекурсивный случай: выбираем голову списка как опорный элемент (pivot)
quicksort (x:xs) = 
    let smallerSorted = quicksort [a | a <- xs, a <= x] -- Элементы меньше или равны x
        biggerSorted  = quicksort [a | a <- xs, a > x]  -- Элементы больше x
    in  smallerSorted ++ [x] ++ biggerSorted

-- Пример использования для проверки
-- Эта часть обязательна для запуска программы!
main :: IO ()
main = do
    let nums = [5, 1, 9, 4, 6, 7, 3]
    putStrLn "Исходный список: [5, 1, 9, 4, 6, 7, 3]"
    putStrLn $ "Отсортированный: " ++ show (quicksort nums)