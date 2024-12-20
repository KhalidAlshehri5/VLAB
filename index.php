<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>تسجيل طالب جديد</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #add8e6;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .register-container {
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
            max-width: 170px;
            margin-bottom: 20px;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        select {
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
            background-color: #17a2b8;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #138496;
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

    <?php
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        // توصيل قاعدة البيانات
        $host = 'localhost'; // أو IP الخادم
        $dbname = 'school_db';
        $username = 'root';
        $password = '';
        $conn = new mysqli($host, $username, $password, $dbname);

        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        // الحصول على البيانات من النموذج
        $studentName = $_POST['studentName'];
        $studentEmail = $_POST['studentEmail'];
        $password = password_hash($_POST['password'], PASSWORD_DEFAULT); // تشفير كلمة المرور
        $educationLevel = $_POST['educationLevel'];

        // إدراج البيانات في قاعدة البيانات
        $sql = "INSERT INTO students (studentName, studentEmail, password, educationLevel) VALUES (?, ?, ?, ?)";

        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ssss", $studentName, $studentEmail, $password, $educationLevel);

        if ($stmt->execute()) {
            echo "<script>alert('تم التسجيل بنجاح');</script>";
        } else {
            //echo "<div style='color: red; text-align: center;'>Error: " . $stmt->error . "</div>";
            echo "<script>alert('".$stmt->error."');</script>";
        }

        $stmt->close();
        $conn->close();
    }
    ?>

    <div class="register-container">
        <img src="your-logo-url.png" alt="شعار الموقع" class="logo"> <!-- تحديث رابط الشعار -->
        <h2>تسجيل طالب جديد</h2>
        <form action="" method="post">
            <input type="text" name="studentName" placeholder="اسم الطالب" required>
            <input type="email" name="studentEmail" placeholder="البريد الإلكتروني" required>
            <input type="password" name="password" placeholder="كلمة المرور" required>
            <select name="educationLevel" required>
                <option value="">اختر المستوى الدراسي</option>
                <option value="bachelor">بكالوريوس</option>
                <option value="diploma">دبلوم</option>
            </select>
            <button type="submit">سجل الآن</button>
        </form>
        <div class="links">
            <p>إذا كان لديك حساب بالفعل، <a href="login.php">اضغط هنا للذهاب إلى صفحة تسجيل الدخول</a></p>
        </div>
    </div>

</body>
</html>
