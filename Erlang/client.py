import socket

# Настройки: тот же адрес и порт, что у Erlang-сервера
HOST = '127.0.0.1'
PORT = 9000 # Укажи тот порт, на котором запустился сервер

try:
    # Создаем TCP сокет
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.connect((HOST, PORT))
        print(f"Подключено к серверу {HOST}:{PORT}")
        
        message = "Привет, Erlang!"
        s.sendall(message.encode()) # Отправляем данные
        
        data = s.recv(1024) # Ждем ответ
        print(f"Ответ от сервера: {data.decode()}")

except Exception as e:
    print(f"Ошибка подключения: {e}")