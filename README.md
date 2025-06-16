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


using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using Newtonsoft.Json;
using UserManagementApp.Models;

namespace UserManagementApp.Data
{
    public class UserStore
    {
        private const string FilePath = "users.json"; // Путь к файлу для хранения пользователей
        private List<User> users = new List<User>();

        public UserStore()
        {
            LoadUsers(); // Загружаем пользователей из файла при инициализации
        }

        private void LoadUsers()
        {
            if (File.Exists(FilePath))
            {
                var json = File.ReadAllText(FilePath);
                users = JsonConvert.DeserializeObject<List<User>>(json) ?? new List<User>();
            }
        }

        public void SaveUsers()
        {
            var json = JsonConvert.SerializeObject(users, Formatting.Indented);
            File.WriteAllText(FilePath, json);
        }

        // Метод для добавления пользователя
        public bool AddUser(string username, string password)
        {
            if (users.Any(u => u.Username.Equals(username, StringComparison.OrdinalIgnoreCase)))
            {
                return false; // Пользователь уже существует
            }

            var passwordHash = HashPassword(password);
            users.Add(new User { Username = username, PasswordHash = passwordHash });
            SaveUsers();
            return true;
        }

        // Метод для удаления пользователя
        public void DeleteUser(string username)
        {
            users.RemoveAll(u => u.Username.Equals(username, StringComparison.OrdinalIgnoreCase));
            SaveUsers();
        }

        // Метод для изменения пароля
        public void ChangePassword(string username, string newPassword)
        {
            var user = users.FirstOrDefault(u => u.Username.Equals(username, StringComparison.OrdinalIgnoreCase));
            if (user != null)
            {
                user.PasswordHash = HashPassword(newPassword);
                SaveUsers();
            }
        }

        // Метод для получения списка пользователей
        public List<string> GetUsernames()
        {
            return users.Select(u => u.Username).ToList();
        }

        // Метод для хеширования пароля
        private string HashPassword(string password)
        {
            using (var sha256 = SHA256.Create())
            {
                var bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                return Convert.ToBase64String(bytes);
            }
        }
    }
}



——-


using System;
using Terminal.Gui;
using UserManagementApp.Data;

namespace UserManagementApp.Views
{
    public class UserManagerView
    {
        private UserStore userStore; // Хранилище пользователей
        private Window window; // Окно управления пользователями



        private ListView userListView; // Список пользователей
        private TextField usernameField; // Поле для ввода имени пользователя
        private TextField passwordField; // Поле для ввода пароля

        // Конструктор для инициализации окна
        public UserManagerView(UserStore userStore)
        {
            this.userStore = userStore;
            Initialize(); // Вызов метода для инициализации UI
        }

        private void Initialize()
        {
            window = new Window("User Management")
            {
                X = 0,
                Y = 1,
                Width = Dim.Fill(),
                Height = Dim.Fill()
            };

            var usernameLabel = new Label("Username:") { X = 1, Y = 1 };
            usernameField = new TextField("") { X = 10, Y = 1, Width = 20 };

            var passwordLabel = new Label("Password:") { X = 1, Y = 2 };
            passwordField = new TextField("") { X = 10, Y = 2, Width = 20, Secret = true };

            var addButton = new Button("Add User") { X = 10, Y = 3 };
            var deleteButton = new Button("Delete User") { X = 10, Y = 4 };
            var changePasswordButton = new Button("Change Password") { X = 10, Y = 5 };

            userListView = new ListView(userStore.GetUsernames())
            {
                X = 1, Y = 7, Width = 30, Height = 10
            };

            addButton.Clicked += OnAddUserClicked;
            deleteButton.Clicked += OnDeleteUserClicked;
            changePasswordButton.Clicked += OnChangePasswordClicked;

            window.Add(usernameLabel, usernameField, passwordLabel, passwordField, 
                        addButton, deleteButton, changePasswordButton, userListView);
            CreateUI();
        }

        private void CreateUI()
        {
            Application.Top.Add(window);
        }

        // Метод для добавления пользователя
        private void OnAddUserClicked()
        {
            var username = usernameField.Text.ToString();
            var password = passwordField.Text.ToString();

            if (!userStore.AddUser(username, password))
            {
                MessageBox.ErrorQuery("Error", "User already exists!", "OK");
            }
            else
            {
                userListView.SetSource(userStore.GetUsernames());
                MessageBox.Query("Success", "User added successfully!", "OK");
            }

            usernameField.Text = "";
            passwordField.Text = "";
        }

        // Метод для удаления пользователя
        private void OnDeleteUserClicked()
        {
            var selectedUser = userListView.SelectedItem;
            if (selectedUser < 0)
            {
                MessageBox.ErrorQuery("Error", "Please select a user to delete!", "OK");
                return;
            }

            var username = userListView.Source[selectedUser].ToString();
            if (MessageBox.Query("Confirm", $"Are you sure you want to delete user {username}?", "Yes", "No") == 0) 
            {
                userStore.DeleteUser(username);
                userListView.SetSource(userStore.GetUsernames());
                MessageBox.Query("Success", "User deleted successfully!", "OK");
            }
        }

        // Метод для изменения пароля
        private void OnChangePasswordClicked()
        {
            var selectedUser = userListView.SelectedItem;
            if (selectedUser < 0)
            {
                MessageBox.ErrorQuery("Error", "Please select a user to change password!", "OK");
                return;
            }

            var username = userListView.Source[selectedUser].ToString();



            var newPassword = MessageBox.Entry("Change Password", $"Enter new password for {username}:", "");
            if (!string.IsNullOrEmpty(newPassword))
            {
                userStore.ChangePassword(username, newPassword);
                MessageBox.Query("Success", "Password changed successfully!", "OK");
                userListView.SetSource(userStore.GetUsernames());
            }
        }
    }
}

————



using Terminal.Gui;
using UserManagementApp.Data;
using UserManagementApp.Views;

namespace UserManagementApp
{
    class Program
    {
        private const string AdminPassword = "Admin123"; // Укажите желаемый пароль администратора

        static void Main(string[] args)
        {
            Application.Init();
            var passwordField = new TextField("") { Secret = true, X = 2, Y = 2, Width = 30 };
            var passwordLabel = new Label("Enter Admin Password:") { X = 2, Y = 1 };

            var passwordWindow = new Window("Admin Login")
            {
                Width = 40,
                Height = 10,
                X = Pos.Center(),
                Y = Pos.Center()
            };
            passwordWindow.Add(passwordLabel, passwordField);
            var loginButton = new Button("Login") { X = 10, Y = 4 };
            passwordWindow.Add(loginButton);

            // Обработчик нажатия кнопки "Login"
            loginButton.Clicked += () =>
            {
                if (passwordField.Text.ToString() == AdminPassword)
                {
                    // Закрываем окно для ввода пароля
                    Application.Top.Remove(passwordWindow);
                    
                    // Инициализируем UserStore и интерфейс управления пользователями
                    var userStore = new UserStore();
                    var userManagerView = new UserManagerView(userStore);
                    Application.Run(); // Запускаем управление пользователями
                }
                else
                {
                    MessageBox.ErrorQuery("Error", "Incorrect password!", "OK");
                }
            };

            // Добавляем окно для ввода пароля в основное окно приложения
            Application.Top.Add(passwordWindow);
            Application.Run();
        }
    }
}