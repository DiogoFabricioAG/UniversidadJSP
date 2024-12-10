<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Inicio - Enrutador</title>
        <style>
        /* Estilos Globales */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            color: #333;
        }

        h1 {
            text-align: center;
            margin: 20px 0;
            color: #2c3e50;
            font-size: 2.2em;
        }

        .container {
            width: 90%;
            max-width: 600px;
            margin: 30px auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        p {
            font-size: 1.2em;
            margin-bottom: 20px;
        }

        /* Menú */
        .menu {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .menu li {
            margin: 15px 0;
        }

        .menu a {
            display: block;
            background-color: #3498db;
            color: #ffffff;
            text-decoration: none;
            font-size: 1.1em;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background-color 0.3s, box-shadow 0.3s;
        }

        .menu a:hover {
            background-color: #2980b9;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
    </style>

    </head>
    <body>
        <h1>Bienvenido al Sistema</h1>
        <div class="container">
            <p>Seleccione una opción:</p>
            <ul class="menu">
                <li><a href="creacionusuario.jsp">Crear Usuario</a></li>
                <li><a href="FacultadServlet">Ver Facultades</a></li>
                <li><a href="verificarpersona.jsp?id=1">Matrícula</a></li>
                <li><a href="verificarpersona.jsp?id=2">Consultar Acta</a></li>
            </ul>
        </div>
    </body>
</html>
