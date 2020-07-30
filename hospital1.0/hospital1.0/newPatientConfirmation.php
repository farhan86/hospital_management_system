<?php
    include_once "connection.php";

    $sql="insert into patients
    (first_name, last_name, age, weight, gender, address, phoneno, disease, doctorid, date, time)
    
    values('".$_POST['first_name']."', '".$_POST['last_name']."', '".$_POST['age']."', '".$_POST['weight']."', '".$_POST['gender']."', '".$_POST['address']."', '".$_POST['phoneno']."', '".$_POST['disease']."', '".$_POST['doctorid']."', '".$_POST['date']."', '".$_POST['time']."')";
?>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="refresh" content="2 url=profile.php">
        <title>New Appointment</title>
        <link rel="stylesheet" href="profile.css">
        <link rel="stylesheet" href="newAppointment.css">
    </head>
<body>
    <div id="header">
        <h1>New Appointment</h1>
        <nav id="topnav">
            <ul>
                <li><a href="profile.php">Dashboard</li>
                <li><a href="staff.php">Staff</a></li>
                <li><a href="equipments.php">Equipments</a></li>
                <li><a href="reports.php">Reports</a></li>
                <li><a href="index.php">Logout</a></li>
            </ul>
        </nav>
    </div>
    <?php
    if(mysqli_query($con, $sql)){
    ?>
    <h1 Style="text-align:center;">New Entry Created Successfully</h1>
    <div align="middle">
    <img src="images.png">
    </div>
    <?php
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($con);
    }
    
    mysqli_close($con);
    ?>
</body>  
</html>