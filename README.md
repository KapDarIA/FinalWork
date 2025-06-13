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


——— 11:35 ——-

<Window x:Class="ImageViewerApp.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Image Viewer" 
        WindowState="Maximized"
        ResizeMode="NoResize">
    <Grid>
        <Grid.RowDefinitions>
            <RowDefinition Height="Auto" />
            <RowDefinition Height="*" />
            <RowDefinition Height="Auto" />
        </Grid.RowDefinitions>

        <!-- Меню -->
        <Menu Height="25">
            <MenuItem Header="Файл">
                <MenuItem Header="Открыть" Click="OpenMenuItem_Click" />
                <MenuItem Header="Выход" Click="ExitMenuItem_Click" />
            </MenuItem>
        </Menu>

        <!-- Строка состояния -->
        <StatusBar Grid.Row="2">
            <StatusBarItem x:Name="statusBarItem" />
        </StatusBar>

        <!-- Полоса прокрутки -->
        <ScrollViewer Grid.Row="1" VerticalScrollBarVisibility="Auto" HorizontalScrollBarVisibility="Auto">
            <Image x:Name="imageControl" Stretch="Uniform" />
        </ScrollViewer>

        <!-- Слайдер для масштабирования -->
        <Slider Grid.Row="2" Minimum="0" Maximum="200" Value="100" TickFrequency="10" 
                ValueChanged="Slider_ValueChanged" VerticalAlignment="Bottom" 
                Width="300" Margin="10" HorizontalAlignment="Left" />
    </Grid>
</Window>

...шаг 3

using Microsoft.Win32;
using System;
using System.Drawing;
using System.IO;
using System.Windows;
using System.Windows.Media.Imaging;

namespace ImageViewerApp
{
    public partial class MainWindow : Window
    {
        private string currentFilePath;

        public MainWindow()
        {
            InitializeComponent();
        }

        private void OpenMenuItem_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Filter = "Images|*.bmp;*.jpg;*.jpeg;*.png";

            if (openFileDialog.ShowDialog() == true)
            {
                currentFilePath = openFileDialog.FileName;
                LoadImage(currentFilePath);
                UpdateStatus();
            }
        }

        private void LoadImage(string filePath)
        {
            BitmapImage bitmapImage = new BitmapImage(new Uri(filePath));
            imageControl.Source = bitmapImage;
            this.Title = Path.GetFileName(filePath); // Установка заголовка
        }

        private void UpdateStatus()
        {
            FileInfo fileInfo = new FileInfo(currentFilePath);
            Bitmap bitmap = new Bitmap(currentFilePath);
            statusBarItem.Content = $"Размер файла: {fileInfo.Length} байт, " +
                                    $"Размер: {bitmap.Width}x{bitmap.Height} пикселей";
        }

        private void Slider_ValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            if (imageControl.Source != null)


            {
                double scale = e.NewValue / 100;

                imageControl.Width = (imageControl.Source.Width * scale);
                imageControl.Height = (imageControl.Source.Height * scale);
            }
        }

        private void ExitMenuItem_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}