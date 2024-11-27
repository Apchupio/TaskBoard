<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TASKBOARD</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center; /* Центрируем текст */
        }

        /* Стили для модального окна */
        .modal {
            display: none; /* Скрываем модальное окно по умолчанию */
            position: fixed; /* Открепляем позицию */
            z-index: 1; /* Ставим на передний план */
            left: 0;
            top: 0;
            width: 100%; /* Полная ширина */
            height: 100%; /* Полная высота */
            overflow: auto; /* Включаем прокрутку при необходимости */
            background-color: rgb(0,0,0); /* Черный фон */
            background-color: rgba(0,0,0,0.4); /* Полупрозрачный черный фон */
        }

        /* Контейнер для модального контента */
        .modal-content {
            background-color: #fefefe;
            margin: auto; /* Центрируем модальное окно */
            padding: 20px;
            border-radius: 8px; /* Закругленные углы */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Тень */
            width: 400px; /* Увеличенная ширина модального окна */
            max-width: 90%; /* Максимальная ширина для мобильных устройств */
        }

        /* Кнопка закрытия */
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

        input[type="text"], input[type="password"] {
            width: calc(100% - 20px); /* Полная ширина с учетом отступов */
            padding: 10px;
            margin: 5px 0; /* Отступы между полями */
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #4CAF50; /* Зеленый фон кнопки */
            color: white; /* Белый текст */
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049; /* Темнее при наведении */
        }

        .button-container {
            margin-top: 20px; /* Отступ сверху для кнопок */
        }

        button {
            margin: 10px; /* Отступы между кнопками */
            padding: 10px 20px; /* Отступы внутри кнопок */
            border-radius: 4px; /* Закругленные углы у кнопок */
            border: none; /* Убираем рамку */
            background-color: #007BFF; /* Цвет фона кнопок */
            color: white; /* Цвет текста кнопок */
            cursor: pointer; /* Курсор при наведении */
        }

        button:hover {
            background-color: #0056b3; /* Темнее при наведении */
        }
    </style>
</head>
<body>
<h1>TASKBOARD</h1>

<div class="button-container">
    <button id="loginBtn">Войти</button>
    <button id="registerBtn">Зарегистрироваться</button>
</div>

<!-- Модальное окно для авторизации -->
<div id="loginModal" class="modal">
    <div class="modal-content">
        <span class="close" id="closeLoginModal">&times;</span>
        <h2>Авторизация</h2>
        <form action="/login" method="post">
            <input type="text" placeholder="Логин" name="email" required>
            <input type="password" placeholder="Пароль" name="password" required>
            <input type="submit" value="Войти">
        </form>
    </div>
</div>

<!-- Модальное окно для регистрации -->
<div id="registerModal" class="modal">
    <div class="modal-content">
        <span class="close" id="closeRegisterModal">&times;</span>
        <h2>Регистрация</h2>
        <form action="/create" method="post">
            <input type="text" placeholder="Логин" name="email" required>
            <input type="password" placeholder="Пароль" name="password" required>
            <input type="text" placeholder="Имя" name="firstname" required>
            <input type="text" placeholder="Фамилия" name="lastName" required>
            <input type="text" placeholder="Отчество" name="secondName" required>
            <input type="text" placeholder="Отдел" name="department" required>
            <input type="submit" value="Зарегистрироваться">
        </form>
    </div>
</div>

<script>
    var loginModal = document.getElementById("loginModal");
    var registerModal = document.getElementById("registerModal");
    var loginBtn = document.getElementById("loginBtn");
    var registerBtn = document.getElementById("registerBtn");
    var closeLoginModal = document.getElementById("closeLoginModal");
    var closeRegisterModal = document.getElementById("closeRegisterModal");

    loginBtn.onclick = function() {
        loginModal.style.display = "block";
    }

    registerBtn.onclick = function() {
        registerModal.style.display = "block";
    }

    closeLoginModal.onclick = function() {
        loginModal.style.display = "none";
    }

    closeRegisterModal.onclick = function() {
        registerModal.style.display = "none";
    }

    window.onclick = function(event) {
        if (event.target == loginModal) {
            loginModal.style.display = "none";
        } else if (event.target == registerModal) {
            registerModal.style.display = "none";
        }
    }
</script>
</body>
</html>



