<?php
$regno = $_POST['regno'];
$studentname = $_POST['studname'];
$semester = $_POST['sem'];
$mark1 = $_POST['mark1'];
$mark2 = $_POST['mark2'];
$mark3 = $_POST['mark3'];
$mark4 = $_POST['mark4'];
$mark5 = $_POST['mark5'];

$btntype = $_POST['btn_submit'];

// Database connection
$conn = new mysqli("localhost", "root", "", "studentdb");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($btntype == "INSERT") {
    $tot = $mark1 + $mark2 + $mark3 + $mark4 + $mark5;
    $avg = $tot / 5;

    $sql = "INSERT INTO stu (regno, stuname, sem, m1, m2, m3, m4, m5, tot, avg)
            VALUES ('$regno', '$studentname', '$semester', '$mark1', '$mark2', '$mark3', '$mark4', '$mark5', '$tot', '$avg')";

    if ($conn->query($sql)) {
        echo "Data Inserted successfully.";
    }
}
elseif ($btntype == "UPDATE") {
    $tot = $mark1 + $mark2 + $mark3 + $mark4 + $mark5;
    $avg = $tot / 5;

    $sql = "UPDATE stu SET 
            stuname='$studentname', sem='$semester',
            m1='$mark1', m2='$mark2', m3='$mark3', m4='$mark4', m5='$mark5',
            tot='$tot', avg='$avg'
            WHERE regno='$regno'";

    if ($conn->query($sql)) {
        echo "Data updated successfully.";
    }
}
elseif ($btntype == "DELETE") {
    $sql = "DELETE FROM stu WHERE regno='$regno'";
    if ($conn->query($sql)) {
        echo "Data deleted successfully.";
    }
}
elseif ($btntype == "DISPLAY") {
    $sql = "SELECT * FROM stu WHERE regno='$regno'";
    if ($result = $conn->query($sql)) {
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            echo "<center><h1>STUDENT DETAILS</h1><br>";
            echo "<table border=1 style='font-size:20px;'>";
            echo "<tr><td>Reg No</td><td>{$row['regno']}</td></tr>";
            echo "<tr><td>Student Name</td><td>{$row['stuname']}</td></tr>";
            echo "<tr><td>Semester</td><td>{$row['sem']}</td></tr>";
            echo "<tr><td>Mark 1</td><td>{$row['m1']}</td></tr>";
            echo "<tr><td>Mark 2</td><td>{$row['m2']}</td></tr>";
            echo "<tr><td>Mark 3</td><td>{$row['m3']}</td></tr>";
            echo "<tr><td>Mark 4</td><td>{$row['m4']}</td></tr>";
            echo "<tr><td>Mark 5</td><td>{$row['m5']}</td></tr>";
            echo "<tr><td>Total</td><td>{$row['tot']}</td></tr>";
            echo "<tr><td>Average</td><td>{$row['avg']}</td></tr>";
            echo "</table></center>";
        } else {
            echo "<center><h1>STUDENT DETAILS NOT AVAILABLE</h1></center>";
        }
    }
}

$conn->close();
?>