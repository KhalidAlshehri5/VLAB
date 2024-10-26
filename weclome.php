<?php
    session_start(); // بدء الجلسة

    // التحقق مما إذا كان المستخدم قد سجل الدخول
    if (!isset($_SESSION['studentName'])) {
        // إذا لم يكن المستخدم مسجلًا، إعادة توجيهه إلى صفحة تسجيل الدخول
        header("Location: login.php");
        exit;
    }
?>

<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>مرحبًا بك</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #add8e6; /* أزرق فاتح */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 100%;
            max-width: 400px;
        }

        .logo {
            max-width: 200px; /* عرض الصورة */
            margin-bottom: 20px;
        }

        h1 {
            color: #333;
            margin-bottom: 20px;
        }

        p {
            color: #555;
            margin-bottom: 30px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #45a049;
        }

        @media (max-width: 600px) {
            .container {
                padding: 15px;
            }

            h1 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- إضافة اللوجو -->
        <img src="your-logo-url.png" alt="Logo" class="logo">

        <h1>مرحبًا، <?php echo htmlspecialchars($_SESSION['studentName']); ?>!</h1>
        <p>لقد قمت بتسجيل الدخول بنجاح.</p>

        <!-- زر تسجيل الخروج -->
        <form action="http://localhost/shabeb/login.php" method="GET">
            <button type="submit">تسجيل الخروج</button>
        </form>
    </div>
</body>
</html>
