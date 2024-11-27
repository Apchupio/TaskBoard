<!DOCTYPE html>
<html>
<head>
    <title>TASKBOARD</title>
</head>
<body>
<h1> TASKBOARD</h1>
<hr>
<h4>Подробная информция о задаче</h4>
<b>Название задачи: </b>${taskList.nameTask} <br>
<b>Отдел: </b>${taskList.department} <br>
<b>Описание задачи: </b>${taskList.textTask} <br>
<b>Дата начала задачи: </b>${taskList.dateOfStart} <br>
<b>Дата дедлайна задачи: </b>${taskList.dateOfEnd} <br>

</hr>
<form action="/task/delete/${taskList.id}" method="post">
    <input type="submit" value="Удалить задачу"/>
</form>
</body>
</html>