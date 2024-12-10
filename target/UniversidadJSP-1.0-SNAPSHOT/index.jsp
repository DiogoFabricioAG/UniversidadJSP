<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Inicio - Enrutador</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f8f9fa;
                color: #333;
            }
            h1 {
                text-align: center;
                color: #4CAF50;
                margin-top: 30px;
            }
            .container {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 70vh;
                flex-direction: column;
            }
            .menu {
                list-style-type: none;
                padding: 0;
                margin: 20px 0;
            }
            .menu li {
                margin: 10px 0;
            }
            .menu a {
                text-decoration: none;
                color: white;
                background-color: #4CAF50;
                padding: 10px 20px;
                border-radius: 5px;
                display: inline-block;
                font-size: 18px;
                transition: background-color 0.3s;
            }
            .menu a:hover {
                background-color: #45a049;
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
