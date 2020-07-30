<?php
    include_once "connection.php";

    if(!mysqli_connect_errno())
    {
        $doctors = mysqli_query($con, "select * from  doctors order by doctorid desc");
        mysqli_close($con);
    }
?>

<!DOCTYPE html>
<html>
    <head>
        <title>Doctor Information</title>
        <link rel="stylesheet" href="profile.css">
        <link rel="stylesheet" href="newAppointment.css">
        <link rel="stylesheet" href="doctorinfo.css">
    </head>
<body>
    <div id="header">
        <h1>Doctor Information</h1>
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
                <th>Speciality</th>
            </thead>
            <tbody>
                <?php
                $sl_no=1;
                foreach($doctors as $doctor){
            ?>
            <tr>
                <td><?php echo $sl_no;?></td>
                <td><?php echo $doctor['first_name'].' '.$doctor['last_name'];?></td>
                <td><?php echo $doctor['dept'];?></td>
            </tr>
            <?php
            $sl_no++;
            };?>
            </tbody>
        </table>
    </div>
</body>
</html>