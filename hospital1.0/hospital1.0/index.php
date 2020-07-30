<!DOCTYPE html>
<html>
<head>
    <title>Manager1.0</title>
    <link rel="stylesheet" href="index.css">
</head>
<body>
    <div id="header">
        <h1>HOSPITAL MANAGER</h1>
    </div>
<div id="form">
<form method="post" action="loginProcess.php">
    <div class="imgcontainer">
    <img src="hospital-nursing-home-signs-admissions-symbol.jpg" alt="Avatar" class="avatar" style="height: 100px; width: 100px;">
  </div>
  <div class="container">
    <label><b>Username</b></label>
    <input type="text" placeholder="Enter Username" name="username" required>

    <label><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" required>
      
    <input type="submit" id="btn" value="login" name="login">
</div>
</form>
</div>
</body>

</html>