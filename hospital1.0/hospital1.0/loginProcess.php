<?php
    session_start();
 
        
        $username = $_POST['username'];
        $password = $_POST['password'];
        
        include_once "connection.php";

        $sql = "SELECT * FROM users WHERE username='$username' and password='$password'";
        $query = mysqli_query($con, $sql);
        $row = mysqli_fetch_array($query);
        
        if($row['username'] == $username && $row['password'] == $password){
            include("profile.php");
        }
        else
        {
            include("index.php");
        }

?>