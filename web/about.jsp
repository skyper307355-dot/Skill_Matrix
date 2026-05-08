<%-- 
    Document   : about
    Created on : 1 Sep, 2024, 7:12:41 PM
    Author     : fujitsu
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Skill Matrix</title>
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
            color: #fff; /* Default text color */
            font-family: Arial, sans-serif; /* Consistent font */
        }

        /* Navigation Bar */
        .navbar {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            background-color: #000;
            box-shadow: 0 2px 10px rgba(0, 78, 146, 0.7);
            position: fixed; /* Fixed position for the navbar */
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

        /* About Section */
        .about-section {
            padding: 60px 20px;
            max-width: 800px;
            margin: 0 auto;
            text-align: center;
        }

        .about-section h2 {
            font-size: 2.5em;
            color: #0ef;
            margin-bottom: 20px;
        }

        .about-section p {
            font-size: 1.2em;
            margin-bottom: 20px;
        }

        .about-points {
            text-align: left;
            list-style-type: none;
            padding: 0;
        }

        .about-points li {
            margin-bottom: 10px;
            font-size: 1.1em;
        }

        .about-points li strong {
            color: #0ef;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .nav-container {
                flex-direction: column;
            }

            .about-section {
                padding: 30px 10px;
            }

            .about-section h2 {
                font-size: 2em;
            }

            .about-section p {
                font-size: 1em;
            }

            .about-points li {
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

    <!-- About Section -->
    <main class="about-section">
        <h2>About Skill Matrix</h2>
        <p>Skill Matrix is a platform designed to help you enhance your skills in various domains. Whether you're a student, a professional, or a hobbyist, our tools and resources will guide you on your journey to success.</p>
        <ul class="about-points">
            <li><strong>Comprehensive Skill Assessments:</strong> We offer a broad range of skill assessments across different fields, ensuring you can measure your abilities accurately.</li>
            <li><strong>Detailed Performance Analysis:</strong> After every assessment, receive an in-depth analysis of your strengths and areas for improvement.</li>
            <li><strong>Flexible Learning Paths:</strong> Choose from a variety of learning paths that align with your goals and preferences.</li>
            <li><strong>Community and Networking:</strong> Connect with like-minded individuals, participate in forums, and share knowledge within our community.</li>
            <li><strong>Continuous Learning:</strong> Access our library of resources, including articles, tutorials, and webinars, to continue learning and growing.</li>
            <li><strong>Career Advancement:</strong> Earn certifications recognized by industry leaders, helping you to advance in your career.</li>
            <li><strong>Secure and Reliable:</strong> Our platform is built with the latest security measures, ensuring your data and progress are protected.</li>
            <li><strong>Global Reach:</strong> Join a global community of learners and professionals, expanding your network and opportunities.</li>
        </ul>
    </main>
</body>
</html>
