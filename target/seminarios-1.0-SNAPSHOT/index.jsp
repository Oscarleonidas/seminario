<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.Estudiante"%>
<%
    if(session.getAttribute("seminarios") == null){
        ArrayList<Estudiante> inscritos = new ArrayList<Estudiante>();
        session.setAttribute("seminarios", inscritos);
    }
    ArrayList<Estudiante> inscritos = (ArrayList<Estudiante>) session.getAttribute("seminarios");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Seminarios</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 900px;
            margin: 20px auto;
            padding: 20px;
            border-radius: 5px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .titulo {
            text-align: center;
            font-size: 28px;
            margin-bottom: 20px;
            color: #333333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
            color: #333333;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        a.button {
            display: inline-block;
            padding: 10px 20px;
            margin-top: 20px;
            color: #ffffff;
            background-color: #007bff;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }
        a.button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="titulo">Lista de Inscritos</h2>
        <a href="MainServlet?op=nuevo" class="button">Nuevo</a>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>FECHA</th>
                    <th>NOMBRE</th>
                    <th>APELLIDOS</th>
                    <th>TURNO</th>
                    <th>SEMINARIOS</th>
                    <th>ACCIONES</th>
                </tr>
            </thead>
            <tbody>
                <% if (inscritos != null) {
                    for (Estudiante item : inscritos) {
                %>
                <tr>
                    <td><%= item.getId() %></td>
                    <td><%= item.getFecha() %></td>
                    <td><%= item.getNombre() %></td>
                    <td><%= item.getApellido() %></td>
                    <td><%= item.getTurno() %></td>
                    <td><%= item.getSeminario() %></td>
                    <td>
                        <a href="MainServlet?op=editar&id=<%= item.getId() %>">Editar</a> |
                        <a href="MainServlet?op=eliminar&id=<%= item.getId() %>"
                           onclick="return(confirm('¿Seguro desea eliminar?'))">Borrar</a>
                    </td>
                </tr>
                <% } } %>
            </tbody>
        </table>
    </div>
</body>
</html>
