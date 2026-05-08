<%-- 
    Document   : contact
    Created on : 1 Sep, 2024, 7:17:19 PM
    Author     : fujitsu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Skill Matrix</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #000;
            margin: 0;
            padding-top: 80px; /* Added to avoid content overlap */
        }

        /* Navigation Bar */
        .navbar {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            background-color: #000;
            box-shadow: 0 2px 10px rgba(0, 78, 146, 0.7);
            position: sticky; /* Fixed position for the navbar */
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

        .nav-left,
        .nav-right {
            display: flex;
            gap: 15px;
        }

        .nav-left li,
        .nav-right li {
            list-style: none;
        }

        .nav-left a,
        .nav-right a {
            text-decoration: none;
            color: #fff; /* Changed to white for better visibility */
            padding: 10px 20px;
            transition: background-color 0.3s, color 0.3s;
            border-radius: 5px;
            border: 2px solid #0ef; /* Added border to make the buttons stand out */
        }

        .nav-left a:hover,
        .nav-right a:hover {
            background-color: #0ef;
            color: #000;
        }

        .login-btn,
        .register-btn {
            background-color: #0ef;
            color: #000;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s, transform 0.3s;
            font-weight: bold;
            position: relative;
        }

        .login-btn:hover,
        .register-btn:hover {
            background-color: #00aaff;
            color: #fff;
            transform: translateY(-5px); /* Move buttons up on hover */
            box-shadow: 0 10px 20px rgba(0, 78, 146, 0.7); /* Add shadow on hover */
        }

        /* Contact Section */
        .contact-section {
            padding: 60px 20px;
            max-width: 800px;
            margin-top: 150px;
            text-align: center;
        }

        .contact-section h2 {
            font-size: 2.5em;
            color: #0ef;
            margin-bottom: 20px;
        }

        .contact-section p {
            color:#0ef;
            font-size: 1.2em;
            margin-bottom: 40px;
        }

        .contact-form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .contact-form input,
        .contact-form textarea {
            padding: 15px;
            font-size: 1em;
            border: none;
            border-radius: 5px;
            background-color: #222;
            color: #fff;
            outline: none;
        }

        .contact-form input::placeholder,
        .contact-form textarea::placeholder {
            color: #aaa;
        }

        .contact-form button {
            padding: 15px;
            font-size: 1em;
            color: #000;
            background-color: #0ef;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
        }

        .contact-form button:hover {
            background-color: #00aaff;
            color: #fff;
        }

        .contact-info {
            font-size: 1.2em;
            color: #fff;
            margin-top: 40px;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar">
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

    <!-- Contact Section -->
    <section class="contact-section">
        <h2>Contact Us</h2>
        <p>If you have any questions, suggestions, or need support, feel free to reach out to us. We're here to help you on your journey to mastering skills and achieving excellence.</p>
        
        <form class="contact-form" action="submit_contact.jsp" method="post">
            <input type="text" name="name" placeholder="Your Name" required>
            <input type="email" name="email" placeholder="Your Email" required>
            <textarea rows="6" name="message" placeholder="Your Message" required></textarea>
            <button type="submit">Send Message</button>
        </form>

        <div class="contact-info">
            <p>📞 Phone: <strong>+91 98380 11971</strong></p>
            <p>📞 Phone: <strong>+91 8707331446</strong></p>
            <p>📧 Email: <strong>devsingh98011@gmail.com</strong></p>
            <p>📧 Email: <strong>aayushjaiswal878@gmail.com</strong></p>
            <p>🏢 Address: <strong>1/253 Jankipuram Extension, Lucknow, Uttar Pradesh (226021)</strong></p>
        </div>
    </section>
</body>
</html>
