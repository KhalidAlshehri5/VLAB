<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>تسجيل الدخول</title>
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
            max-width: 200px;
            margin-bottom: 20px;
        }

        input[type="email"],
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

        .message {
            text-align: center;
            margin-bottom: 15px;
        }

    </style>
</head>
<body>

  <?php
    session_start(); // لبدء الجلسة

    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        // توصيل قاعدة البيانات
        $host = 'localhost';
        $dbname = 'school_db';
        $username = 'root';
        $password = '';
        $conn = new mysqli($host, $username, $password, $dbname);

        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        // الحصول على البيانات من النموذج
        $studentEmail = $_POST['studentEmail'];
        $password = $_POST['password'];

        // البحث عن المستخدم حسب البريد الإلكتروني
        $sql = "SELECT id, studentName, password FROM students WHERE studentEmail = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("s", $studentEmail);
        $stmt->execute();
        $stmt->store_result();

        if ($stmt->num_rows > 0) {
            $stmt->bind_result($id, $studentName, $hashedPassword);
            $stmt->fetch();

            // التحقق من كلمة المرور
            if (password_verify($password, $hashedPassword)) {
                $_SESSION['studentName'] = $studentName;
                $_SESSION['studentId'] = $id;
                echo "<div class='message' style='color: green;'>مرحبًا، $studentName!</div>";
                // إعادة التوجيه إلى صفحة أخرى عند تسجيل الدخول بنجاح
                header("Location: welcome.php");
                exit;
            } else {
                echo "<div class='message' style='color: red;'>كلمة المرور غير صحيحة.</div>";
            }
        } else {
            echo "<div class='message' style='color: red;'>البريد الإلكتروني غير مسجل.</div>";
        }

        $stmt->close();
        $conn->close();
    }
  ?>

  <!-- نموذج تسجيل الدخول -->
  <div class="login-container">
      <!-- إضافة اللوجو -->
      <img src="your-logo-url.png" alt="Logo" class="logo">

      <h2>تسجيل الدخول</h2>
      <form method="POST" action="">
          <label for="studentEmail">:البريد الإلكتروني</label>
          <input type="email" id="studentEmail" name="studentEmail" required><br>

          <label for="password">:كلمة المرور</label>
          <input type="password" id="password" name="password" required><br>

          <button type="submit">تسجيل الدخول</button>
      </form>

      <div class="links">
          
          <br>
          <a href="index.php">إنشاء حساب جديد</a>
      </div>
  </div>

</body>
</html>
