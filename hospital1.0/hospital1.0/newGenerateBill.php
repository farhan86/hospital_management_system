<?php
	include_once "connection.php";

	$sql1 ="insert into bills
	(pid, doctor_charge, medicine_charge, room_charge, oprtn_charge, no_of_days, nursing_charge, date)

	values('".$_POST['pid']."', '".$_POST['doctor_charge']."', '".$_POST['medicine_charge']."', '".$_POST['room_charge']."', '".$_POST['oprtn_charge']."', '".$_POST['no_of_days']."', '".$_POST['nursing_charge']."', now())";

	$sql3 = "update bills b, lab l
	set b.patient_type = l.patient_type, b.lab_charge = l.amount
	where b.pid = l.pid";

	$sql2 = "update bills b, inpatient i
    set b.advance = i.advance
    where b.pid = i.pid";

	$sql4 = "update bills
    set bill = (doctor_charge+medicine_charge+room_charge+oprtn_charge+nursing_charge+lab_charge)-advance";
	
    $sql5 = "update inpatient i, bills b
    set date_of_dis = now()
    where i.pid = b.pid;"

?>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="refresh" content="2; url=bills.php">
        <title>Generate Bill</title>
        <link rel="stylesheet" href="profile.css">
        <link rel="stylesheet" href="newAppointment.css">
    </head>
<body>
    <div id="header">
        <h1>Generate Bill</h1>
        <nav id="topnav">
            <ul>
                <li><a href="profile.php">Dashboard</li>
                <li><a href="staff.php">Staff</a></li>
                <li><a href="bills.php">Bills</a></li>
                <li><a href="reports.php">Reports</a></li>
                <li><a href="index.php">Logout</a></li>
            </ul>
        </nav>
    </div>
    <?php
    if(mysqli_query($con, $sql1)){
    ?>
    <h1 Style="text-align:center;">New Entry Created Successfully</h1>
    <div align="middle">
    <img src="images.png">
    </div>
    <?php
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($con);
    }
    
    ?>

    <?php
    mysqli_query($con, $sql3);
    ?>

    <?php
    mysqli_query($con, $sql2);
    ?>

    <?php
    mysqli_query($con, $sql4);
    ?>

    <?php
    mysqli_query($con, $sql5);
    mysqli_close($con);
    ?>

</body>  
</html>