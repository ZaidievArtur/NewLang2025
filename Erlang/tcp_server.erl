-module(tcp_server).
-export([start/1]). % Точка входа: функция start с 1 аргументом

% --- Запуск сервера ---
start(Port) ->
    % Открываем порт для прослушивания
    {ok, ListenSocket} = gen_tcp:listen(Port, [
        binary,           % Получаем данные как бинарные строки
        {packet, 0},      % Тип пакетов (0 — сырые данные)
        {active, false},  % Ручной режим приема (пассивный)
        {reuseaddr, true} % Позволяет переоткрывать порт мгновенно
    ]),
    io:format("Сервер запущен в VS Code на порту ~p~n", [Port]),
    accept_loop(ListenSocket).

% --- Цикл ожидания подключений ---
accept_loop(ListenSocket) ->
    % Программа "замирает" здесь, ожидая клиента
    {ok, Socket} = gen_tcp:accept(ListenSocket),
    
    % Создаем новый процесс для клиента (параллельность!)
    spawn(fun() -> handle_client(Socket) end),
    
    % Сразу возвращаемся к ожиданию следующего клиента
    accept_loop(ListenSocket).

% --- Обработка сообщений клиента ---
handle_client(Socket) ->
    case gen_tcp:recv(Socket, 0) of
        {ok, Data} ->
            io:format("Получено: ~s", [Data]),
            gen_tcp:send(Socket, <<"Echo: ", Data/binary>>),
            handle_client(Socket); % Рекурсия вместо цикла while
        {error, closed} ->
            io:format("Соединение закрыто~n")
    end.