<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Crear Usuario</title>
        <style>
        /* Estilos Globales */
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            color: #333;
        }

        h1 {
            text-align: center;
            margin-top: 20px;
            color: #2c3e50;
        }

        /* Formulario */
        form {
            width: 90%;
            max-width: 600px;
            margin: 20px auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-section {
            margin-bottom: 20px;
        }

        .form-section h3 {
            margin-bottom: 10px;
            color: #3498db;
            border-bottom: 2px solid #3498db;
            padding-bottom: 5px;
        }

        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }

        input, select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
        }

        input:focus, select:focus {
            outline: none;
            border-color: #3498db;
            box-shadow: 0 0 5px rgba(52, 152, 219, 0.5);
        }

        button {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #2980b9;
        }
    </style>

    </head>
    <body>
        <h1>Crear Nuevo Usuario</h1>

        <form action="CrearUsuarioServlet" method="post">
            <!-- Sección Datos Personales -->
            <div class="form-section">
                <h3>Datos Personales</h3>
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" required>

                <label for="apellido">Apellido:</label>
                <input type="text" id="apellido" name="apellido" required>

                <label for="dni">DNI:</label>
                <input type="text" id="dni" name="dni" maxlength="8" required>

                <label for="sexo">Sexo:</label>
                <select id="sexo" name="sexo" required>
                    <option value="1">Masculino</option>
                    <option value="2">Femenino</option>
                </select>

                <label for="ubigeo">Ubigeo:</label>
                <input type="number" id="ubigeo" name="ubigeo" required>

                <label for="fecha_nacimiento">Fecha de Nacimiento:</label>
                <input type="date" id="fecha_nacimiento" name="fecha_nacimiento" required>

                <label for="direccion">Dirección:</label>
                <input type="text" id="direccion" name="direccion">

                <label for="telefono">Teléfono:</label>
                <input type="text" id="telefono" name="telefono">

                <label for="email">Email:</label>
                <input type="email" id="email" name="email">
            </div>

            <!-- Sección Alumnos -->
            <div class="form-section">
                <h3>Información del Alumno</h3>
                <label for="id_escuela">ID Escuela:</label>
                <input type="number" id="id_escuela" name="id_escuela" required>

                <label for="id_codigo">Código de Alumno:</label>
                <input type="text" id="id_codigo" name="id_codigo" maxlength="9" required>

                <label for="estado">Estado:</label>
                <select id="estado" name="estado" required>
                    <option value="1">Activo</option>
                    <option value="2">Inactivo</option>
                </select>
            </div>

            <button type="submit">Crear Usuario</button>
        </form>
    </body>
</html>
