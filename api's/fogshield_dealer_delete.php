<?php
include("../common/db.php");

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

$user_id = $_POST['user_id'] ?? '';

if (empty($user_id)) {
echo json_encode(["status" => false, "msg" => "User ID is required for deletion"]);
exit;
}

// Optional: Check if user exists first
$checkSql = "SELECT id FROM fogshield_dealer_users WHERE id = ?";
$checkStmt = sqlsrv_query($con, $checkSql, [$user_id]);

if ($checkStmt && sqlsrv_has_rows($checkStmt)) {

// Delete Operation
$deleteSql = "DELETE FROM fogshield_dealer_users WHERE id = ?";
$deleteStmt = sqlsrv_query($con, $deleteSql, [$user_id]);

if ($deleteStmt) {
echo json_encode(["status" => true, "msg" => "Account deleted successfully"]);
} else {
echo json_encode([
"status" => false,
"msg" => "Failed to delete account",
"error" => print_r(sqlsrv_errors(), true)
]);
}

} else {
echo json_encode(["status" => false, "msg" => "User not found"]);
}

} else {
echo json_encode(["status" => false, "msg" => "Invalid Request Method"]);
}
?>