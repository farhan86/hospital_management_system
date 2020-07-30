<?php
    include_once "connection.php";

    if(!mysqli_connect_errno())
    {
        $reports = mysqli_query($con, "select l.pid, p.first_name as pfname, p.last_name as plname, p.age, l.weight, p.disease, d.first_name as dfname, d.last_name as dlname, d.dept, l.category, l.patient_type, l.date, l.amount, i.room_no
        from lab l join patients p
        on p.pid = l.pid
        join doctors d
        on p.doctorid = d.doctorid
        left outer join inpatient i
        on l.labno = i.labno
        order by l.labno desc");
        mysqli_close($con);
    }
?>

<!DOCTYPE html>
<html>
    <head>
        <title>Report</title>
        <link rel="stylesheet" href="profile.css">
        <link rel="stylesheet" href="newAppointment.css">
        <link rel="stylesheet" href="doctorinfo.css">
    </head>
<body>
    <div id="header">
        <h1>Reports</h1>
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
                <th>Weight</th>
                <th>Test Type</th>
                <th>Patient Type</th>
                <th>Room No</th>              
                <th>Amount</th>
                <th></th>
            </thead>
            <tbody>
                <?php
                $sl_no=1;
                foreach ($reports as $row){
            ?>
            <tr>
                <td><?php echo $sl_no;?></td>
                <td><?php echo $row['pfname'].' '.$row['plname'];?></td>
                <td><?php echo $row['age'];?></td>
                <td><?php echo $row['disease'];?></td>
                <td><?php echo $row['dfname'].' '.$row['dlname'].' - '.$row['dept'];?></td>
                <td><?php echo $row['date'];?></td>
                <td><?php echo $row['weight'];?></td>
                <td><?php echo $row['category'];?></td>
                <td><?php echo $row['patient_type'];?></td>
                <td><?php echo $row['room_no'];?></td>
                <td><?php echo $row['amount'];?></td>
                <td><a href="generateBill.php">Generate Bill</td>
            </tr>
            <?php
            $sl_no++;
            };?>
            </tbody>
        </table>
    </div>
</body>
</html>