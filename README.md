9<h1 align="center">₊ ˚ ⊹ ₊ ˚ ⊹ ♡ ≽^-⩊-^≼ ♡ ⊹ ˚ ₊ ⊹ ˚ ₊</h1>
<h2 align="center">Итоговая работа по технологии разработки и защиты баз данных</h2>

  ✦ <a href="https://github.com/KapDarIA/FinalWork/blob/main/Лекции.docx">Лекции</a><br/>
  ✦ <a href="https://github.com/KapDarIA/FinalWork/blob/main/Отчеты.docx">Отчеты</a><br/>
  ✦ <a href="https://github.com/KapDarIA/FinalWork/blob/main/FinalWork.zip">Приложение</a><br/>
  ✦ <a href="https://github.com/KapDarIA/FinalWork/blob/main/scriptBD.sql">Скрипт для базы данных</a><br/>

Работу выполняла:
<a href="https://github.com/KapDarIA">Капитанская Дарья<a/>
<br/><br/><br/><br/><br/>
  
> С любовью ИСПП-21❤️


using Microsoft.AspNetCore.SignalR.Client;

class Program
{
    static async Task Main(string[] args)
    {
        // Создание подключения к серверу SignalR
        var connection = new HubConnectionBuilder()
            .WithUrl("http://localhost:5000/chat") // Убедитесь, что адрес соответствует вашему серверу
            .Build();

        // Настройка callback для получения сообщений от сервера
        connection.On<string, string>("ReceiveMessage", (user, message) =>
        {
            Console.WriteLine($"{user}: {message}");
        });

        // Запуск соединения с сервером
        try
        {
            await connection.StartAsync();
            Console.WriteLine("Соединение установлено");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Ошибка при подключении: {ex.Message}");
            return;
        }

        // Бесконечный цикл для отправки сообщений пользователем
        while (true)
        {
            Console.Write("Введите ваше имя: ");
            var user = Console.ReadLine();

            Console.Write("Введите сообщение: ");
            var message = Console.ReadLine();

            // Отправка сообщения на сервер
            await connection.InvokeAsync("SendMessage", user, message);
        }
    }
}


—- 10:26 —
using Microsoft.AspNetCore.SignalR;
using System.Collections.Concurrent;

public class ChatHub : Hub
{
    // Хранение соответствий ConnectionId и имен пользователей
    private static ConcurrentDictionary<string, string> ConnectionToUser = new ConcurrentDictionary<string, string>();
    
    // Хранение соответствий ConnectionId и названий комнат
    private static ConcurrentDictionary<string, string> ConnectionToRoom = new ConcurrentDictionary<string, string>();

    public async Task JoinRoom(string roomName, string userName)
    {
        // Получаем ConnectionId
        var connectionId = Context.ConnectionId;

        // Привязываем соединение к комнате и пользователю
        ConnectionToRoom[connectionId] = roomName;
        ConnectionToUser[connectionId] = userName;

        // Добавляем соединение в группу (комнату) по имени комнаты
        await Groups.AddToGroupAsync(connectionId, roomName);
    }

    public async Task SendMessage(string message)
    {
        var connectionId = Context.ConnectionId;

        // Проверка наличия имени пользователя и комнаты в ConcurrentDictionary
        if (ConnectionToRoom.TryGetValue(connectionId, out var room) &&
            ConnectionToUser.TryGetValue(connectionId, out var user))
        {
            // Отправка данных клиентам в определенной группе
            await Clients.Group(room).SendAsync("ReceiveMessage", user, message);
        }
    }

    public override async Task OnDisconnectedAsync(Exception? exception)
    {
        var connectionId = Context.ConnectionId;

        // Проверка, существует ли привязка на отключение
        if (ConnectionToRoom.TryRemove(connectionId, out var room) 
            && ConnectionToUser.TryRemove(connectionId, out var user))
        {
            // Удаляем соединение из группы (комнаты)
            await Groups.RemoveFromGroupAsync(connectionId, room);
        }

        await base.OnDisconnectedAsync(exception);
    }
}

шаг 2

using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.SignalR.Client;

class Program
{
    static async Task Main(string[] args)
    {
        var connection = new HubConnectionBuilder()
            .WithUrl("http://localhost:5000/chat")
            .Build();

        connection.On<string, string>("ReceiveMessage", (user, message) =>
        {
            Console.WriteLine($"{user}: {message}");
        });

        try
        {
            await connection.StartAsync();
            Console.WriteLine("Соединение установлено");

            Console.Write("Введите ваше имя: ");
            var userName = Console.ReadLine();

            Console.Write("Введите имя комнаты: ");
            var roomName = Console.ReadLine();

            // Присоединение к комнате
            await connection.InvokeAsync("JoinRoom", roomName, userName);

            while (true)
            {
                Console.Write("Введите сообщение: ");
                var message = Console.ReadLine();



                // Отправка сообщения в текущую комнату
                await connection.InvokeAsync("SendMessage", message);
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Ошибка при подключении: {ex.Message}");
        }
    }
}