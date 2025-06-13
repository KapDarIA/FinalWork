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

using System;
using System.Drawing;
using System.IO;

class Program
{
    static void Main(string[] args)
    {
        // Проверка наличия входных аргументов
        if (args.Length != 2)
        {
            Console.WriteLine("Использование: ImageInverter <input-folder> <output-folder>");
            return;
        }

        string inputFolder = args[0];
        string outputFolder = args[1];

        // Проверка существования папок
        if (!Directory.Exists(inputFolder))
        {
            Console.WriteLine("Входная папка не найдена.");
            return;
        }

        // Создание выходной папки, если она не существует
        Directory.CreateDirectory(outputFolder);

        // Получение всех файлов изображений в папке
        var imageFiles = Directory.GetFiles(inputFolder, "*.*", SearchOption.AllDirectories)
            .Where(file => file.EndsWith(".jpg", StringComparison.OrdinalIgnoreCase) ||
                           file.EndsWith(".png", StringComparison.OrdinalIgnoreCase) ||
                           file.EndsWith(".bmp", StringComparison.OrdinalIgnoreCase));

        foreach (var imageFile in imageFiles)
        {
            try
            {
                // Инверсия цветов
                var invertedImage = InvertColors(imageFile);

                // Определение пути к выходному файлу
                var filename = Path.GetFileName(imageFile);
                var outputFilePath = Path.Combine(outputFolder, filename);

                // Сохранение инвертированного изображения
                invertedImage.Save(outputFilePath);
                invertedImage.Dispose();

                Console.WriteLine($"Инвертировано: {filename}");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Ошибка обработки файла {imageFile}: {ex.Message}");
            }
        }

        Console.WriteLine("Обработка завершена.");
    }

    static Bitmap InvertColors(string imagePath)
    {
        using (var originalImage = new Bitmap(imagePath))
        {
            var invertedImage = new Bitmap(originalImage.Width, originalImage.Height);
            
            for (int y = 0; y < originalImage.Height; y++)
            {
                for (int x = 0; x < originalImage.Width; x++)
                {
                    Color originalColor = originalImage.GetPixel(x, y);
                    // Инверсия цветов
                    Color invertedColor = Color.FromArgb(255 - originalColor.R, 255 - originalColor.G, 255 - originalColor.B);
                    invertedImage.SetPixel(x, y, invertedColor);
                }
            }

            return invertedImage;
        }
    }
}



