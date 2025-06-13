<h1 align="center">₊ ˚ ⊹ ₊ ˚ ⊹ ♡ ≽^-⩊-^≼ ♡ ⊹ ˚ ₊ ⊹ ˚ ₊</h1>
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
