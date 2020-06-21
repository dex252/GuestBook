# GuestBook

Инструкция для Windows (запуск локальной версии)

1.	БД (в процессе)
	-	Убедиться в наличии установленной MySql 8.0 [Офф. сайт](https://dev.mysql.com/downloads/windows/installer/8.0.html), [прямая ссылка](https://drive.google.com/file/d/1tZqq3g82t8zI91oXylV8w0ocRpisnyZR/view?usp=sharing)
	-	Перейти в папку с установленной mysql, стандартный путь: C:\Program Files\MySQL\MySQL Server 8.0\bin  и выполнить в консоли команду mysql.exe -u<имя_пользователя> -p
	-	Ввести пароль, далее прописать    /<путь к>/messagebase.sql , файл с дампом расположен в папке dump в корне проекта 
2.	Rest
	-	Убедиться в наличии установленного Net Core 3.1 [ссылка](https://dotnet.microsoft.com/download/dotnet-core/3.1)
	-	Перейти в корень папки GuestBook (там расположен файл GuestBook.csproj)
	-	Изменить настройки соединения с бд в файле appsettings.json на собственные (строка DefaultConnection) 
	-	Выполнить в консоли команду dotnet run
3.	Сайт
	-	Убедиться в наличии установленной node js [инстукция](https://metanit.com/web/nodejs/1.1.php)
	-	Установить angular cli с помощью консоли, выполнив команду npm install -g @angular/cli
	-	Перейти в папку Web\WebBook в консоли и выполнить команду npm install для загрузки зависимостей
	-	Запустить сайт с помощью команды ng serve -o