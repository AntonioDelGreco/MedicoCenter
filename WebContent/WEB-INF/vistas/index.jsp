<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<link rel="icon" href="https://img.icons8.com/?size=100&id=6hBgDC60H79i&format=png&color=000000" type="image/x-icon">
<style>
        body {
            padding: 0;
            margin: 0;
        }

        .index-container {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #ACE0FF;
            width: 100%;
            height: 100vh;
        }

        .content-container {
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            align-items: center;
            width: 70%;
            height: 70%;
            border: 1px solid gray;
            border-radius: 2em;
            box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.25);
            background-color: #c9e3f1;
        }

        .content-title {
            display: flex;
            flex-direction: column;
            align-items: center;

        }

        .content-title img {
            width: 13em;
            filter: drop-shadow(5px 5px 5px rgba(0, 0, 0, 0.25));
        }

        .content-title h2 {
            font-size: 4em;
            margin: 0;
            filter: drop-shadow(5px 5px 5px rgba(0, 0, 0, 0.25));
        }

        .content-title p {
            font-style: italic;
            font-size: 1.5em;
            filter: drop-shadow(5px 5px 5px rgba(0, 0, 0, 0.25));
        }

        .button {
            padding: .5em;
            margin: .5em;
            font-size: 1.5em;
            font-weight: bold;
            color: #000;
            background-color: #4A97FF;
            border-radius: .5em;
            border: 1px solid #000;
            white-space: nowrap;
            box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.25);
        }

        .button:disabled {
            opacity: 0.5;
            cursor: not-allowed;
            pointer-events: none;
        }

        .button:hover {
            color: #000;
            background-color: #ACE0FF;
            border: 1px solid #4A97FF;
            transform: scale(1.05);
            transform-origin: center;
            transition: .3s;
            cursor: pointer;
        }
    </style>
</head>
<div class="index-container">
        <div class="content-container">
            <div class="content-title">
                <img src="https://static.vecteezy.com/system/resources/previews/014/322/451/original/hospital-icons-design-in-blue-circle-png.png" alt="">
                <h2>MedCenter</h2>
                <p>"Optimizando la atención medica, un turno a la vez."</p>
            </div>
            <form action="redireccionar_login.html" method="get">
                <button type="submit" name="page" value="login" class="button">Iniciar sesión</button>
            </form>
        </div>
    </div>
</body>
</html>