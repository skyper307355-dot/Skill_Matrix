<%@page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Skill Matrix - Rules</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #000;
            margin: 0;
            padding-top: 80px; /* To avoid overlap with navbar */
            color: #fff;
            font-family: Arial, sans-serif;
        }

        /* Navigation Bar */
        .navbar {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            background-color: #000;
            box-shadow: 0 2px 10px rgba(0, 78, 146, 0.7);
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
        }

        .nav-container {
            display: flex;
            justify-content: space-between;
            width: 100%;
            max-width: 1200px;
            padding: 0 20px;
        }

        .nav-left, .nav-right {
            display: flex;
            gap: 15px;
        }

        .nav-left li, .nav-right li {
            list-style: none;
        }

        .nav-left a, .nav-right a {
            text-decoration: none;
            color: #fff;
            padding: 10px 20px;
            transition: background-color 0.3s, color 0.3s;
            border-radius: 5px;
            border: 2px solid #0ef;
        }

        .nav-left a:hover, .nav-right a:hover {
            background-color: #0ef;
            color: #000;
        }

        .login-btn, .register-btn {
            background-color: #0ef;
            color: #000;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s, transform 0.3s;
            font-weight: bold;
            position: relative;
        }

        .login-btn:hover, .register-btn:hover {
            background-color: #00aaff;
            color: #fff;
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 78, 146, 0.7);
        }

        /* Rules Section */
        .rules-section {
            padding: 60px 20px;
            max-width: 800px;
            margin: 0 auto;
            text-align: center;
        }

        .rules-section h2 {
            font-size: 2.5em;
            color: #0ef;
            margin-bottom: 20px;
        }

        .rules-section p {
            font-size: 1.2em;
            margin-bottom: 20px;
        }

        .rules-points {
            text-align: left;
            list-style-type: none;
            padding: 0;
        }

        .rules-points li {
            margin-bottom: 10px;
            font-size: 1.1em;
        }

        .rules-points li strong {
            color: #0ef;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .nav-container {
                flex-direction: column;
            }

            .rules-section {
                padding: 30px 10px;
            }

            .rules-section h2 {
                font-size: 2em;
            }

            .rules-section p {
                font-size: 1em;
            }

            .rules-points li {
                font-size: 1em;
            }
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar" role="navigation" aria-label="Main Navigation">
        <div class="nav-container">
            <ul class="nav-left">
                <li><a href="index.html">Home</a></li>
                <li><a href="about.jsp">About</a></li>
                <li><a href="rules.jsp">Rules</a></li>
                <li><a href="contact.jsp">Contact</a></li>
            </ul>
            <ul class="nav-right">
                <li><a href="Login.jsp" class="login-btn">Login</a></li>
                <li><a href="Registration.jsp" class="register-btn">Register</a></li>
            </ul>
        </div>
    </nav>

    <!-- Rules Section -->
    <main class="rules-section">
        <h2>Rules of Skill Matrix</h2>
        <p>To ensure a smooth and fair examination process, we have established the following rules:</p>
        <ul class="rules-points">
            <li><strong>Integrity and Honesty:</strong> Maintain integrity and honesty during exams.</li>
            <li><strong>No Unauthorized Materials:</strong> Do not use unauthorized materials or aids.</li>
            <li><strong>Time Management:</strong> Complete the exam within the allotted time.</li>
            <li><strong>Follow Instructions:</strong> Follow all instructions provided during the exam.</li>
            <li><strong>Report Issues:</strong> Report any technical issues immediately to the exam proctor.</li>
        </ul>
    </main>
</body>
</html>
