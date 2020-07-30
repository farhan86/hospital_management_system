<?php
    include_once "connection.php";

    if(!mysqli_connect_errno())
    {
        $reports = mysqli_query($con, "select b.pid, p.first_name as pfname, p.last_name as plname, p.age, l.weight, p.disease, d.first_name as dfname, d.last_name as dlname, d.dept, l.category, l.patient_type, b.date, b.doctor_charge, b.medicine_charge, b.room_charge, b.oprtn_charge, b.no_of_days, b.nursing_charge, b.advance, b.lab_charge, b.bill
        from bills b join patients p
        on p.pid = b.pid
        join doctors d
        on p.doctorid = d.doctorid
        join lab l
        on l.pid = b.pid
        order by b.bill_no desc");
        mysqli_close($con);
    }
?>

<!DOCTYPE html>
<html>
    <head>
        <title>Bills</title>
        <link rel="stylesheet" href="profile.css">
        <link rel="stylesheet" href="newAppointment.css">
        <link rel="stylesheet" href="doctorinfo.css">
    </head>
<body>
    <div id="header">
        <h1>Bills</h1>
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
                <th>Doctor Charge</th>              
                <th>Medicine Charge</th>
                <th>Room Charge</th>
                <th>Operation Charge</th>
                <th>Number of Days</th>
                <th>Nursing Charge</th>
                <th>Advance</th>
                <th>Lab Charge</th>
                <th>Total Bill(Advance excluded)</th>
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
                <td><?php echo $row['doctor_charge'];?></td>
                <td><?php echo $row['medicine_charge'];?></td>
                <td><?php echo $row['room_charge'];?></td>
                <td><?php echo $row['oprtn_charge'];?></td>
                <td><?php echo $row['no_of_days'];?></td>
                <td><?php echo $row['nursing_charge'];?></td>
                <td><?php echo $row['advance'];?></td>
                <td><?php echo $row['lab_charge'];?></td>
                <td><?php echo $row['bill'];?></td>
            </tr>
            <?php
            $sl_no++;
            };?>
            </tbody>
        </table>
    </div>
</body>
</html>