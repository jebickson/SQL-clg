<?php
$eno   = $_POST['empno'];
$ename = $_POST['ename'];
$desig = $_POST['des'];
$bp    = $_POST['bp'];
$da    = $_POST['da'];
$hra   = $_POST['hra'];
$pf    = $_POST['pf'];
$btntype = $_POST['btn_submit'];

// database connection
$conn = new mysqli("localhost", "root", "", "studentdb");
if ($conn->connect_error) {
    die("Connection failed : " . $conn->connect_error);
}

if ($btntype == "INSERT") {
    $gp = $bp + $da + $hra;
    $np = $gp - $pf;

    $sql = "INSERT INTO emp VALUES('$eno','$ename','$desig','$bp','$da','$hra','$pf','$gp','$np')";
    if ($conn->query($sql))
        echo "Data Inserted successfully.";
}

elseif ($btntype == "UPDATE") {
    $gp = $bp + $da + $hra;
    $np = $gp - $pf;

    $sql = "UPDATE emp SET eno='$eno',ename='$ename',desig='$desig',
            bp='$bp',da='$da',hra='$hra',pf='$pf',gp='$gp',np='$np' 
            WHERE eno='$eno'";
    if ($conn->query($sql))
        echo "Data updated successfully.";
}

elseif ($btntype == "DELETE") {
    $sql = "DELETE FROM emp WHERE eno='$eno'";
    if ($conn->query($sql))
        echo "Data deleted successfully.";
}

elseif ($btntype == "DISPLAY") {
    $sql = "SELECT * FROM emp WHERE eno='$eno'";
    if ($result = $conn->query($sql)) {
        $row = $result->fetch_assoc();
        if ($result->num_rows > 0) {
            echo "<center><h1>EMPLOYEE DETAILS</h1><br><font size=20><table border=1>";
            echo "<tr><td width=100>Emp.No</td><td width=150>".$row["eno"]."</td></tr>";
            echo "<tr><td>Employee Name</td><td>".$row["ename"]."</td></tr>";
            echo "<tr><td>Designation</td><td>".$row["desig"]."</td></tr>";
            echo "<tr><td>Basic Pay</td><td>".$row["bp"]."</td></tr>";
            echo "<tr><td>Dearness Allowance</td><td>".$row["da"]."</td></tr>";
            echo "<tr><td>HRA</td><td>".$row["hra"]."</td></tr>";
            echo "<tr><td>PF</td><td>".$row["pf"]."</td></tr>";
            echo "<tr><td>Gross Pay</td><td>".$row["gp"]."</td></tr>";
            echo "<tr><td>Net Pay</td><td>".$row["np"]."</td></tr>";
            echo "</table></center>";
        } else {
            echo "<center><h1>EMPLOYEE DETAILS NOT AVAILABLE</h1></center>";
        }
    }
}

elseif ($btntype == "DISPLAY ALL") {
    $query = "SELECT * FROM emp";
    $result = mysqli_query($conn, $query);

    echo "<center><h1>EMPLOYEE REPORT</h1></center>";
    echo "<center><table border=1 cellspacing=0 cellpadding=10>";
    echo "<tr><th>E.No</th><th>EName</th><th>Designation</th><th>Basic Pay</th>
          <th>DA</th><th>HRA</th><th>PF</th><th>Gross Pay</th><th>Net Pay</th></tr>";
    $sn = 0;

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            echo "<tr>";
            echo "<td>".$row['eno']."</td>";
            echo "<td>".$row['ename']."</td>";
            echo "<td>".$row['desig']."</td>";
            echo "<td>".$row['bp']."</td>";
            echo "<td>".$row['da']."</td>";
            echo "<td>".$row['hra']."</td>";
            echo "<td>".$row['pf']."</td>";
            echo "<td>".$row['gp']."</td>";
            echo "<td>".$row['np']."</td>";
            echo "</tr>";
            $sn++;
        }
        echo "</table>";
    } else {
        echo "<tr><td colspan='9'>No data found</td></tr></table>";
    }
    echo "<br>Total No. of Rows = ".$sn;
}
?>