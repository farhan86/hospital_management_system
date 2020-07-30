<?php
    include_once "connection.php";

    if(!mysqli_connect_errno())
    {
        $appointments = mysqli_query($con, "select p.pid, p.first_name as pfname, p.last_name as plname, p.age, p.disease, d.first_name as dfname, d.last_name as dlname, d.dept, p.date, p.time
        from patients p join doctors d
        on (p.doctorid = d.doctorid)
        order by p.pid desc");
        mysqli_close($con);
    }
?>

<!DOCTYPE html>
<html>
    <head>
        <title>Appointment List</title>
        <link rel="stylesheet" href="profile.css">
        <link rel="stylesheet" href="newAppointment.css">
        <link rel="stylesheet" href="doctorinfo.css">
    </head>
</html>
<body>
    <div id="header">
        <h1>Appointment List</h1>
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
        <table>
            <thead>
                <th>SL #</th>
                <th>Name</th>
                <th>Age</th>
                <th>Disease</th>
                <th>Doctor</th>
                <th>Date and Time</th>
                <th></th>
            </thead>
            <tbody>
                <?php
                $sl_no=1;
                foreach ($appointments as $row){
            ?>
            <tr>
                <td><?php echo $sl_no;?></td>
                <td><?php echo $row['pfname'].' '.$row['plname'];?></td>
                <td><?php echo $row['age'];?></td>
                <td><?php echo $row['disease'];?></td>
                <td><?php echo $row['dfname'].' '.$row['dlname'].' - '.$row['dept'];?></td>
                <td><?php echo $row['date'].' at '.$row['time'];?></td>
                <td><a href="generateReport.php">Generate Report</td>
            </tr>
            <?php
            $sl_no++;
            };?>
            </tbody>
        </table>
    </div>
</body>