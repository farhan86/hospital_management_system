<?php
    include_once "connection.php";

    $outpatient=mysqli_query($con, "select * from lab");
    foreach ($outpatient as $outpatients) {
    	mysqli_query($con, "insert into outpatient (pid, date, labno) select pid, date, labno from lab where patient_type like '%outpatient%'");
    }
    mysqli_close($con);
?>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="refresh" content="4; url=profile.php">
        </head>
        </html>