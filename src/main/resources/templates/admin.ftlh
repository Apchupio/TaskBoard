<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TASKBOARD</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h1 {
            color: #333;
            text-align: center;
        }
        hr {
            border: 1px solid #ccc;
        }
        h4 {
            color: #555;
        }
        form {
            margin-bottom: 20px;
        }
        input[type="text"], input[type="date"], textarea {
            width: 100%;
            padding: 10px;
            margin: 5px 0 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"], button {
            background-color: #28a745; /* Зеленый цвет */
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover, button:hover {
            background-color: #218838; /* Темно-зеленый при наведении */
        }
        #taskList {
            max-height: 300px; /* Задайте максимальную высоту */
            overflow-y: auto; /* Включите вертикальную прокрутку */
            border: 1px solid #ccc; /* Добавьте рамку */
            padding: 10px; /* Добавьте отступы */
            margin-bottom: 20px; /* Отступ снизу */
            background-color: white; /* Белый фон */
            border-radius: 4px; /* Скругленные углы */
        }
        .task-item {
            padding: 10px;
            border-bottom: 1px solid #eee; /* Разделение задач */
        }
        .task-item:last-child {
            border-bottom: none; /* Убираем разделитель у последней задачи */
        }
        .modal {
            display: none; /* Скрыть по умолчанию */
            position: fixed; /* Окно фиксировано */
            z-index: 1; /* На переднем плане */
            left: 0;
            top: 0;
            width: 100%; /* Полная ширина */
            height: 100%; /* Полная высота */
            overflow: auto; /* Включите прокрутку, если необходимо */
            background-color: rgba(0,0,0,0.6); /* Полупрозрачный черный фон */
        }
        .modal-content {
            background-color: #fefefe;
            margin: 10% auto; /* Центрирование окна */
            padding: 20px;
            border-radius: 8px; /* Скругленные углы */
            width: 80%; /* Ширина окна */
            box-shadow: 0 2px 10px rgba(0,0,0,0.2); /* Тень для эффекта поднятости */
        }
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
<h1> TASKBOARD</h1>
<hr>
<h4>Все пользователи</h4>
<form action="/admin" method="get">
    Поиск по отделению:
    <input type="text" name="department" placeholder="Введите название отделения..."><br>
    <input type="submit" value="Поиск"/>
</form>
<div id="userList">

        <#list userList as users>
            <div class="user-item" method="get">
                ${users.firstName} ${users.lastName} ${users.department} |
                <a href="/admin/create/${users.id}"> <input type="button" value="Подробнее"> </a>
            </div>
        </#list>

</div>

<h3>Создать нового пользователя</h3>
<button id="createUserBtn">Создать нового пользователя</button>
<!-- Модальное окно -->
<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>Создать нового пользователя</h2>
        <form action="/admin/create" method="post">

            <label for="login">Логин:</label><br>
            <input type="text" id="login" name="login" required><br>

            <label for="password">Пароль:</label><br>
            <input type="password" id="password" name="password" required><br>

            <label for="firstname">Имя:</label><br>
            <input type="text" id="firstname" name="firstname" required><br>

            <label for="lastName">Фамилия:</label><br>
            <input type="text" id="lastName" name="lastName" required><br>

            <label for="secondName">Отчество:</label><br>
            <input type="text" id="secondName" name="secondName"><br>

            <label for="department">Отдел:</label><br>
            <input type="text" id="department" name="department" required><br>

            <input type="submit" value="Создать пользователя">
        </form>
    </div>
</div>

<script>
    // Получаем модальное окно
    var modal = document.getElementById("myModal");

    // Получаем кнопку, которая открывает модальное окно
    var btn = document.getElementById("createUserBtn");

    // Получаем элемент <span>, который закрывает модальное окно
    var span = document.getElementsByClassName("close")[0];

    // Когда пользователь нажимает на кнопку, открываем модальное окно
    btn.onclick = function() {
        modal.style.display = "block";
    }

    // Когда пользователь нажимает на <span> (x), закрываем модальное окно
    span.onclick = function() {
        modal.style.display = "none";
    }
</script>
</body>
</html>