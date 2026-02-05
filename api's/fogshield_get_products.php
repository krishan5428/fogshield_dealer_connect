<?php
include("../../common/db.php");

header('Content-Type: application/json');

// Ensure only GET requests are processed
if ($_SERVER['REQUEST_METHOD'] !== 'GET') {
    echo json_encode([
        "status" => false,
        "msg" => "Invalid Request Method"
    ]);
    exit;
}

// Fetch only the 4 critical columns required for price/name updates
$sql = "
    SELECT
        s_no,
        name,
        end_user_price,
        mrp
    FROM fogshield_products
    ORDER BY id ASC
";

$stmt = sqlsrv_query($con, $sql);

if ($stmt === false) {
    echo json_encode([
        "status" => false,
        "msg" => "Query failed"
    ]);
    exit;
}

$products = [];

while ($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)) {
    // Return numeric values as float to ensure correct JSON typing
    $products[] = [
        "s_no" => $row['s_no'],
        "name" => $row['name'],
        "end_user_price" => (float)$row['end_user_price'],
        "mrp" => (float)$row['mrp']
    ];
}

echo json_encode([
    "status" => true,
    "data" => $products
]);
?>