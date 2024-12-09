<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Error</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #fdf2f2;
                color: #333;
                margin: 0;
                padding: 0;
            }
            .container {
                text-align: center;
                margin-top: 15%;
            }
            h1 {
                color: #e74c3c;
                margin-bottom: 20px;
            }
            p {
                font-size: 18px;
            }
            a {
                text-decoration: none;
                color: white;
                background-color: #e74c3c;
                padding: 10px 20px;
                border-radius: 5px;
                display: inline-block;
                margin-top: 20px;
            }
            a:hover {
                background-color: #c0392b;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>¡Ha Ocurrido un Error!</h1>
            <p>No se pudo completar la operación. Por favor, intenta nuevamente.</p>
            <a href="creacionusuario.jsp">Volver al formulario</a>
        </div>
    </body>
</html>
