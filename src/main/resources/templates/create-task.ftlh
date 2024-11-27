<!DOCTYPE html>
<html>
<head>
    <title>TASKBOARD</title>
</head>
<body>
<h1> TASKBOARD</h1>
<hr>
<hr>
<h3>Добавление задачи</h3>
<form action="/task/create/taskCreate" method="post">
    <input type="hidden" name="id" value="0"/>
    <input type="hidden" name="status" value="false"/>
    <input type="hidden" name="dateOfDelivery" value=""/>
    Отдел: <input type="text" name="department"/><br><br>
    Название задачи: <input type="text" name="nameTask"/><br><br>
    Описание задачи: <input type="text" name="textTask"/><br><br>
    <input type="submit" value="Добавить задачу"/>
</form>
</body>
</html>