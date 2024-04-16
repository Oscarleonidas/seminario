<%@page import="java.util.Arrays"%>
<%@page import="com.emergentes.Estudiante"%>
<%
    Estudiante est = (Estudiante) request.getAttribute("miestudent");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Registro de Seminarios</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            width: 80%;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #333333;
            margin-bottom: 30px;
            text-align: center;
        }
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
        }
        input[type="text"],
        input[type="date"],
        input[type="radio"],
        input[type="checkbox"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
        }
        th, td {
            padding: 15px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
            color: #333333;
            font-weight: bold;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        div.actions {
            margin-top: 30px;
            text-align: center;
        }
        input[type="submit"] {
            padding: 15px 30px;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Registro de Seminarios</h2>
        <form action="MainServlet" method="post">
            <table>
                <tr>
                    <th>Datos</th>
                    <th>Seminarios Disponibles</th>
                </tr>
                <tr>
                    <td>
                        <label for="id">Id:</label>
                        <input type="text" id="id" name="id" value="<%= est.getId() %>" readonly>
                        <label for="fecha">Fecha:</label>
                        <input type="date" id="fecha" name="fecha" value="<%= est.getFecha() %>">
                        <label for="nombre">Nombre:</label>
                        <input type="text" id="nombre" name="nombre" value="<%= est.getNombre() %>">
                        <label for="apellido">Apellidos:</label>
                        <input type="text" id="apellido" name="apellido" value="<%= est.getApellido() %>">
                        <label for="turno">Turno:</label>
                        <br>
                        <input type="radio" id="op1" name="turno" value="Mañana" <%= est.getTurno().equals("Mañana") ? "checked" : "" %>>
                        <label for="op1">Mañana</label>
                        <input type="radio" id="op2" name="turno" value="Tarde" <%= est.getTurno().equals("Tarde") ? "checked" : "" %>>
                        <label for="op2">Tarde</label>
                        <input type="radio" id="op3" name="turno" value="Noche" <%= est.getTurno().equals("Noche") ? "checked" : "" %>>
                        <label for="op3">Noche</label>
                    </td>
                    <td>
                        <input type="checkbox" id="op1" name="seminario" value="Inteligencia Artificial" <%= Arrays.asList(est.getSeminario()).contains("Inteligencia Artificial") ? "checked" : "" %>>
                        <label for="op1">Inteligencia Artificial</label>
                        <br>
                        <input type="checkbox" id="op2" name="seminario" value="Machine Learning" <%= Arrays.asList(est.getSeminario()).contains("Machine Learning") ? "checked" : "" %>>
                        <label for="op2">Machine Learning</label>
                        <br>
                        <input type="checkbox" id="op3" name="seminario" value="Simulación con Arena" <%= Arrays.asList(est.getSeminario()).contains("Simulación con Arena") ? "checked" : "" %>>
                        <label for="op3">Simulación con Arena</label>
                        <br>
                        <input type="checkbox" id="op4" name="seminario" value="Robótica Educativa" <%= Arrays.asList(est.getSeminario()).contains("Robótica Educativa") ? "checked" : "" %>>
                        <label for="op4">Robótica Educativa</label>
                    </td>
                </tr>
            </table>
            <div class="actions">
                <input type="submit" value="Enviar">
            </div>
        </form>
    </div>
</body>
</html>
