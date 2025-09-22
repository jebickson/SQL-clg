<?php
$bookid = $_POST['bookid'];
$bname  = $_POST['bname'];
$author = $_POST['author'];
$pub    = $_POST['pub'];
$price  = $_POST['price'];
$btntype = $_POST['btn_submit'];

// Database connection
$conn = new mysqli("localhost", "root", "", "studentdb");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($btntype == "INSERT") {
    $sql = "INSERT INTO library VALUES('$bookid','$bname','$author','$pub','$price')";
    if ($conn->query($sql))
        echo "Data Inserted successfully.";
}

elseif ($btntype == "UPDATE") {
    $sql = "UPDATE library SET bname='$bname', author='$author', 
            publisher='$pub', price='$price' WHERE bookid='$bookid'";
    if ($conn->query($sql))
        echo "Data updated successfully.";
}

elseif ($btntype == "DELETE") {
    $sql = "DELETE FROM library WHERE bookid='$bookid'";
    if ($conn->query($sql))
        echo "Data deleted successfully.";
}

elseif ($btntype == "DISPLAY") {
    $sql = "SELECT * FROM library WHERE bookid='$bookid'";
    if ($result = $conn->query($sql)) {
        $row = $result->fetch_assoc();
        if ($result->num_rows > 0) {
            echo "<center><h1>BOOK DETAILS</h1>";
            echo "<table border=1>";
            echo "<tr><td>Book Id</td><td>".$row["bookid"]."</td></tr>";
            echo "<tr><td>Book Name</td><td>".$row["bname"]."</td></tr>";
            echo "<tr><td>Author Name</td><td>".$row["author"]."</td></tr>";
            echo "<tr><td>Publisher</td><td>".$row["publisher"]."</td></tr>";
            echo "<tr><td>Price</td><td>".$row["price"]."</td></tr>";
            echo "</table></center>";
        } else {
            echo "<center><h1>BOOK DETAILS NOT AVAILABLE</h1></center>";
        }
    }
}

elseif ($btntype == "DISPLAY ALL") {
    $query = "SELECT * FROM library";
    $result = mysqli_query($conn, $query);

    echo "<center><h1>AVAILABLE BOOK DETAILS</h1></center>";
    echo "<center><table border=1 cellspacing=0 cellpadding=10>";
    echo "<tr><th>Book Id</th><th>Book Name</th><th>Author</th><th>Publisher</th><th>Price</th></tr>";
    $sn = 0;

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            echo "<tr>";
            echo "<td>".$row['bookid']."</td>";
            echo "<td>".$row['bname']."</td>";
            echo "<td>".$row['author']."</td>";
            echo "<td>".$row['publisher']."</td>";
            echo "<td>".$row['price']."</td>";
            echo "</tr>";
            $sn++;
        }
        echo "</table>";
    } else {
        echo "<tr><td colspan='5'>No data found</td></tr></table>";
    }
    echo "<br>Total No. of Rows = ".$sn;
}
?>