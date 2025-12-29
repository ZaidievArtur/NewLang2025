use std::thread;

fn main() {
    // 1. Подготовка данных: массив от 0 до 999,999
    let numbers: Vec<u64> = (0..1_000_000).collect();
    
    // 2. Определяем количество потоков
    let num_threads = 4;
    
    // 3. Вычисляем размер порции (chunk) для каждого потока
    let chunk_size = numbers.len() / num_threads;
    
    let mut handles = vec![];

    // 4. Разрезаем данные и создаем потоки
    // Используем .chunks() для автоматического деления массива
    for (i, chunk) in numbers.chunks(chunk_size).enumerate() {
        // Клонируем данные для потока (в реальных проектах лучше Arc, 
        // но для обучения здесь используем копирование части вектора)
        let data = chunk.to_vec();
        
        let handle = thread::spawn(move || {
            let partial_sum: u64 = data.iter().sum();
            println!("Поток {}: посчитал сумму {}", i, partial_sum);
            partial_sum
        });
        
        handles.push(handle);
    }

    // 5. Сбор результатов
    let mut total_sum = 0;
    for handle in handles {
        // join() ждет завершения потока и возвращает его результат
        total_sum += handle.join().unwrap();
    }

    println!("---");
    println!("Итоговая сумма: {}", total_sum);
}