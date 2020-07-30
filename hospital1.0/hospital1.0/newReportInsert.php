<?php
	include_once "connection.php";

	$sql1 ="insert into lab
	(pid, date, category, patient_type, amount)

	values('".$_POST['pid']."', now(), '".$_POST['category']."', '".$_POST['patient_type']."', '".$_POST['amount']."')";

	$sql3 = "update lab l, patients p
	set l.weight = p.weight, l.doctorid = p.doctorid
	where l.pid = p.pid";

	$sql2 = "INSERT INTO outpatient (pid) SELECT l.pid from lab l where patient_type like '%outpatient%' and not exists(SELECT o.pid
		from outpatient o
		where o.pid = l.pid)";

	$sql4 = "update outpatient o, lab l
	set o.date = l.date, o.labno = l.labno
	where o.pid = l.pid";

	$sql5 = "INSERT INTO inpatient (pid) SELECT l.pid from lab l where patient_type like '%inpatient%'and not exists(SELECT o.pid
        from inpatient o
        where o.pid = l.pid)";

	$sql6 = "update inpatient i, lab l
    set i.labno = l.labno, i.date_of_adm = l.date
    where i.pid = l.pid";

    $sql7 = "update inpatient i, lab l
    set i.room_no = '".$_POST['room_no']."', i.advance = '".$_POST['advance']."'
    where i.pid = l.pid";

	
?>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="refresh" content="2; url=reports.php">
        <title>New Report</title>
        <link rel="stylesheet" href="profile.css">
        <link rel="stylesheet" href="newAppointment.css">
    </head>
<body>
    <div id="header">
        <h1>New Report</h1>
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
    ?>

    <?php
     mysqli_query($con, $sql6);
    ?>

    <?php
    mysqli_query($con, $sql7);
    mysqli_close($con);
    ?>
</body>  
</html>