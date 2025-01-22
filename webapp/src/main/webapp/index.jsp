<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration App</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .registration-container {
            width: 100%;
            max-width: 400px;
            padding: 20px;
            background: #ffffff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        .registration-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        form input {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
        }
        form button {
            padding: 10px;
            background-color: #6200ea;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        form button:hover {
            background-color: #4500b3;
        }
        .success-message {
            text-align: center;
            color: green;
            margin-top: 10px;
            display: none;
        }
        .error-message {
            text-align: center;
            color: red;
            margin-top: 10px;
            display: none;
        }
    </style>
</head>
<body>
    <div class="registration-container">
        <h2>Register Here</h2>
        <form id="registrationForm">
            <input type="text" id="username" placeholder="Username" required>
            <input type="email" id="email" placeholder="Email" required>
            <input type="password" id="password" placeholder="Password" required>
            <button type="submit">Register</button>
        </form>
        <p class="success-message" id="successMessage">Registration Successful! A confirmation email has been sent.</p>
        <p class="error-message" id="errorMessage">An error occurred while sending the email.</p>
    </div>

    <script>
        document.getElementById('registrationForm').addEventListener('submit', async function(event) {
            event.preventDefault();

            const username = document.getElementById('username').value;
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;

            if (username && email && password) {
                try {
                    // Simulate email sending via a mock API (replace with actual email service integration)
                    await sendEmail(username, email);
                    document.getElementById('successMessage').style.display = 'block';
                    document.getElementById('errorMessage').style.display = 'none';
                } catch (error) {
                    document.getElementById('errorMessage').style.display = 'block';
                    document.getElementById('successMessage').style.display = 'none';
                }
            }
        });

        async function sendEmail(username, email) {
            // Example of sending email through a mock API endpoint (to be replaced with actual backend integration)
            const response = await fetch('https://mock-email-service.com/send', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    to: email,
                    subject: 'Welcome to the App!',
                    body: `Hello ${username},\n\nThank you for registering!\n\nBest regards,\nThe Team`
                })
            });

            if (!response.ok) {
                throw new Error('Failed to send email');
            }
        }
    </script>
</body>
</html>
