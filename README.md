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
        private const string FilePath = "users.json";
        private List<User> users = new List<User>();

        public UserStore()
        {
            LoadUsers();
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

        public bool AddUser(string username, string password)
        {
            if (users.Any(u => u.Username.Equals(username, StringComparison.OrdinalIgnoreCase)))
            {
                return false; // User already exists
            }

            var passwordHash = HashPassword(password);
            users.Add(new User { Username = username, PasswordHash = passwordHash });
            SaveUsers();
            return true;
        }

        public List<string> GetUsernames()
        {
            return users.Select(u => u.Username).ToList();
        }

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

———-


using System;
using Terminal.Gui;
using UserManagementApp.Data;

namespace UserManagementApp.Views
{
    public class UserManagerView
    {
        private UserStore userStore;
        private Window window;
        private ListView userListView;
        private TextField usernameField;
        private TextField passwordField;

        public UserManagerView(UserStore userStore)
        {
            this.userStore = userStore;
            Initialize();
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

———


            userListView = new ListView(userStore.GetUsernames())
            {
                X = 1, Y = 5, Width = 30, Height = 10
            };

            addButton.Clicked += OnAddUserClicked;

            window.Add(usernameLabel, usernameField, passwordLabel, passwordField, addButton, userListView);
            CreateUI();
        }

        private void CreateUI()
        {
            Application.Top.Add(window);
        }

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
    }
}


——

using Terminal.Gui;
using UserManagementApp.Data;
using UserManagementApp.Views;

namespace UserManagementApp
{
    class Program
    {
        static void Main(string[] args)
        {
            Application.Init();
            var userStore = new UserStore();
            var userManagerView = new UserManagerView(userStore);
            Application.Run();
        }
    }
}