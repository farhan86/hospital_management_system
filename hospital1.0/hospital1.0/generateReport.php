<?php
    include_once "connection.php";

    if(!mysqli_connect_errno())
    {
        $reports = mysqli_query($con, "select * from patients
            order by pid desc");
    }
?>

<!DOCTYPE html>
<html>
    <head>
        <title>Generate Report</title>
        <link rel="stylesheet" href="profile.css">
        <link rel="stylesheet" href="newAppointment.css">
    </head>
<body>
    <div id="header">
        <h1>Generate Report</h1>
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
    <div id="middle">
        <form name="new_report" method="post" action="newReportInsert.php">
            <p>
                <strong>Patient</strong><br>
                <select name="pid" required>
                    <?php
                    foreach($reports as $report){
                    ?>
                        <option value="<?php echo $report['pid'];?>"><?php echo $report['first_name'].' '.$report['last_name'];?></option>
                    <?php
                    };?>
                </select>
            </p>
            <p>
                <strong>Test type</strong><br>
                <input type="text" name="category" required>
            </p>
            <p>
                <strong>Patient Type</strong><br>
                <select name="patient_type">
                    <option value="inpatient">In Patient</option>
                    <option value="outpatient">Out Patient</option>
                </select>
            </p>
            <p>
                <strong>Amount</strong><br>
                <input type="number" name="amount">
            </p>
            <p>
                <strong>Room Number(If Inpatient)</strong><br>
                <input type="text" name="room_no">
            </p>
            <p>
                <strong>Room Advance(If Inpatient)</strong><br>
                <input type="number" name="advance">
            </p>
            <p>
                    <input type="submit" name="submit" value="Save">
                </p>
        </form>
    </div>

</body>
</html>
