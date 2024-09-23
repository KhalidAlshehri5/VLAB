<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>تسجيل الطلاب</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e0f7fa; /* الخلفية السماوية الفاتحة */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            box-sizing: border-box;
            text-align: center;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .logo {
            max-width: 170px; /* حجم الشعار */
            margin-bottom: 20px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #17a2b8; /* اللون السماوي */
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #138496; /* لون أغمق عند التمرير */
        }

        .links {
            text-align: center;
            margin-top: 15px;
        }

        .links a {
            color: #007bff;
            text-decoration: none;
        }

        .links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="login-container">
        <!-- إضافة الشعار هنا -->
        <img src="your-logo-url.png" alt="شعار الموقع" class="logo">
        <h2>:تسجيل دخول الطلاب</h2>
        <form action="#" method="post">
            <input type="text" name="username" placeholder="اسم المستخدم" required>
            <input type="password" name="password" placeholder="كلمة المرور" required>
            <button type="submit">تسجيل الدخول</button>
        </form>
        <div class="links">
            <p><a href="#">نسيت كلمة المرور؟</a></p>
            <p><a href="#">إذا كنت لا تملك حساب، سجل هنا</a></p>
        </div>
    </div>

</body>
</html>