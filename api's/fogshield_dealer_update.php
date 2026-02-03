<?php
include("../common/db.php");

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    // Required: ID to identify who to update
    $user_id = $_POST['user_id'] ?? '';

    if (empty($user_id)) {
        echo json_encode(["status" => false, "msg" => "User ID is required"]);
        exit;
    }

    // Fields to update (Optional - if not provided, we keep old values ideally,
    // but SQL requires values. In a robust API, we build query dynamically.)

    // For simplicity, we expect all editable fields. If you send empty, it saves empty.
    // Ideally, Flutter app sends current value if unchanged.
    $name         = $_POST['name'] ?? null;
    $email        = $_POST['email'] ?? null;
    $address      = $_POST['address'] ?? null;
    $company_name = $_POST['company_name'] ?? null;
    $gst_number   = $_POST['gst_number'] ?? null;
    $updated_at   = date('Y-m-d H:i:s');

    // Dynamic Query Builder
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
        // Fetch updated data to return
        $fetchSql = "SELECT * FROM fogshield_dealer_users WHERE id = ?";
        $fetchStmt = sqlsrv_query($con, $fetchSql, [$user_id]);
        $row = sqlsrv_fetch_array($fetchStmt, SQLSRV_FETCH_ASSOC);

        // Format dates
        if(isset($row['created_at']) && $row['created_at'] instanceof DateTime)
            $row['created_at'] = $row['created_at']->format('Y-m-d H:i:s');
        if(isset($row['updated_at']) && $row['updated_at'] instanceof DateTime)
            $row['updated_at'] = $row['updated_at']->format('Y-m-d H:i:s');

        echo json_encode([
            "status" => true,
            "msg" => "Profile updated successfully",
            "data" => $row
        ]);
    } else {
        echo json_encode([
            "status" => false,
            "msg" => "Update failed",
            "error" => print_r(sqlsrv_errors(), true)
        ]);
    }

} else {
    echo json_encode(["status" => false, "msg" => "Invalid Request Method"]);
}
?>