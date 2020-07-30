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
                <li><a href="bills.php">Bills</a></li>
                <li><a href="reports.php">Reports</a></li>
                <li><a href="index.php">Logout</a></li>
            </ul>
        </nav>
    </div>
    <div id="middle">
            <form name="new_patient" method="post" action="newPatientConfirmation.php">
                <p>
                    <strong>First Name</strong><br>
                    <input type="text" name="first_name" required>
                </p>
                 <p>
                    <strong>Last Name</strong><br>
                    <input type="text" name="last_name" required>
                </p>
                <p>
                    <strong>Age</strong><br>
                    <input type="number" name="age" required>
                </p>
                <p>
                    <strong>Gender</strong><br>
                    <input type="radio" name="gender" value="Male">Male
                    <input type="radio" name="gender" value="Female">Female
                    <input type="radio" name="gender" value="Other">Other
                </p>
                <p>
                    <strong>Weight(Kg)</strong><br>
                    <input type="number" name="weight" required>
                </p>
                <p>
                    <strong>Disease</strong><br>
                    <textarea name="disease" cols="30" rows="5"></textarea>
                </p>
                <p>
                    <strong>Phone</strong><br>
                    <input type="number" name="phoneno" required>
                </p>
                <p>
                    <strong>Address</strong><br>
                    <input type="text" name="address" required>
                </p>
                <p>
                    <strong>Doctor</strong><br>
                    <select name="doctorid">
                    <?php
                    foreach ($doctors as $doctor) {
                    ?>
                        <option value="<?php echo $doctor['doctorid'];?>"><?php echo $doctor['first_name'].' '.$doctor['last_name'];?> - <?php echo $doctor['dept'];?></option>
                    <?php
                    };?>
                    </select>
                </p>
                <p>
                    <strong>Date</strong><br>
                    <input type="date" name="date" min="<?php echo date(
                    'Y-m-d');?>" required>
                </p>
                <p>
                    <strong>Time</strong><br>
                    <input type="time" name="time" required>
                </p>
                <p>
                    <input type="submit" name="submit" value="Save">
                </p>
            </form>
        </div>
</body>
</html>