<?php
// CHANGED: used ../../ because we are now inside the 'fogshield_dealer_connect' folder
include("../../common/db.php");

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $user_id = $_POST['user_id'] ?? '';

    if (empty($user_id)) {
        echo json_encode(["status" => false, "msg" => "User ID is required"]);
        exit;
    }

    $name         = $_POST['name'] ?? null;
    $email        = $_POST['email'] ?? null;
    $address      = $_POST['address'] ?? null;
    $company_name = $_POST['company_name'] ?? null;
    $gst_number   = $_POST['gst_number'] ?? null;
    $updated_at   = date('Y-m-d H:i:s');

    $sql = "UPDATE fogshield_dealer_users SET updated_at = ?";
    $params = [$updated_at];

    if ($name !== null) { $sql .= ", name = ?"; $params[] = $name; }
    if ($email !== null) { $sql .= ", email = ?"; $params[] = $email; }
    if ($address !== null) { $sql .= ", address = ?"; $params[] = $address; }
    if ($company_name !== null) { $sql .= ", company_name = ?"; $params[] = $company_name; }
    if ($gst_number !== null) { $sql .= ", gst_number = ?"; $params[] = $gst_number; }

    $sql .= " WHERE id = ?";
    $params[] = $user_id;

    $stmt = sqlsrv_query($con, $sql, $params);

    if ($stmt) {
        $fetchSql = "SELECT * FROM fogshield_dealer_users WHERE id = ?";
        $fetchStmt = sqlsrv_query($con, $fetchSql, [$user_id]);
        $row = sqlsrv_fetch_array($fetchStmt, SQLSRV_FETCH_ASSOC);

        if(isset($row['created_at']) && $row['created_at'] instanceof DateTime)
            $row['created_at'] = $row['created_at']->format('Y-m-d H:i:s');
        if(isset($row['updated_at']) && $row['updated_at'] instanceof DateTime)
            $row['updated_at'] = $row['updated_at']->format('Y-m-d H:i:s');

        echo json_encode(["status" => true, "msg" => "Profile updated successfully", "data" => $row]);
    } else {
        echo json_encode(["status" => false, "msg" => "Update failed"]);
    }
} else {
    echo json_encode(["status" => false, "msg" => "Invalid Request Method"]);
}
?>