<?php
    include_once "connection.php";

    if(!mysqli_connect_errno())
    {
        $staffs = mysqli_query($con, "select * from  staff order by staff_id desc");
        mysqli_close($con);
    }
?>

<!DOCTYPE html>
<html>
    <head>
        <title>staffs</title>
        <link rel="stylesheet" href="profile.css">
        <link rel="stylesheet" href="newAppointment.css">
        <link rel="stylesheet" href="doctorinfo.css">
    </head>
</html>
<body>
    <div id="header">
        <h1>Staff Information</h1>
        <nav id="topnav">
            <ul>
                <li><a href="profile.php">Dashboard</li>
                <li style="background-color: steelblue;"><a href="staff.php">Staff</a></li>
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
                <th>Phone</th>
                <th>Designation</th>
            </thead>
            <tbody>
                <?php
                $sl_no=1;
                foreach($staffs as $staff){
            ?>
            <tr>
                <td><?php echo $sl_no;?></td>
                <td><?php echo $staff['first_name'].' '.$staff['last_name'];?></td>
                <td><?php echo $staff['age'];?></td>
                <td><?php echo $staff['phoneno'];?></td>
                <td><?php echo $staff['qualification'];?></td>
            </tr>
            <?php
            $sl_no++;
            };?>
            </tbody>
        </table>
    </div>
</body>