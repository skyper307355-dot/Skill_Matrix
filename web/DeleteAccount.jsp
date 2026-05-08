<%-- 
    Document   : DeleteAccount
    Created on : 12 Sep, 2024, 2:54:25 PM
    Author     : fujitsu
--%>

<%@page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Account</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .delete-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .delete-container h2 {
            text-align: center;
            color: red;
        }

        .delete-container form {
            text-align: center;
            margin-top: 20px;
        }

        .delete-container input[type="submit"] {
            padding: 10px 20px;
            background-color: red;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="delete-container">
        <h2>Delete Your Account</h2>
        <form action="DeleteAccount" method="post">
            <input type="submit" value="Delete My Account">
        </form>
    </div>
</body>
</html>
