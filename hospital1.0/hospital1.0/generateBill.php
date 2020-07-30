<?php
    include_once "connection.php";

    if(!mysqli_connect_errno())
    {
        $reports = mysqli_query($con, "select p.pid, p.first_name, p.last_name, l.pid, l.patient_type 
        	from patients p, lab l
        	where p.pid = l.pid
            order by l.labno desc");
    }
?>

<!DOCTYPE html>
<html>
    <head>
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
    <div id="middle">
        <form name="new_report" method="post" action="newGenerateBill.php">
            <p>
                <strong>Patient</strong><br>
                <select name="pid" required>
                    <?php
                    foreach($reports as $report){
                    ?>
                        <option value="<?php echo $report['pid'];?>"><?php echo $report['first_name'].' '.$report['last_name'].' - '.$report['patient_type'];?></option>
                    <?php
                    };?>
                </select>
            </p>
            </p>
                <strong>Doctor Charge</strong><br>
                <input type="number" name="doctor_charge" required>
            </p>
            <p>
                <strong>Medicine Charge</strong><br>
                <input type="number" name="medicine_charge">
            </p>
            <p>
                <strong>Room Charge</strong><br>
                <input type="number" name="room_charge">
            </p>
            <p>
                <strong>Operation Charge</strong><br>
                <input type="number" name="oprtn_charge">
            </p>
            <p>
                <strong>Number of Days</strong><br>
                <input type="number" name="no_of_days">
            </p>
            <p>
                <strong>Nursing Charge</strong><br>
                <input type="number" name="nursing_charge">
            </p>
            <p>
                    <input type="submit" name="submit" value="Save">
                </p>
        </form>
    </div>

</body>
</html>