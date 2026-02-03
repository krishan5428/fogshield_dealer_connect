<?php
// CHANGED: used ../../ because we are now inside the 'fogshield_dealer_connect' folder
include("../../common/db.php");

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] == "POST") {

    $mobile = $_POST['mobile'] ?? '';
    $pass   = $_POST['pass'] ?? '';
    $dev_id = $_POST['dev_id'] ?? '';

    if (empty($mobile) || empty($pass)) {
        echo json_encode(["status" => false, "msg" => "Mobile and Password required"]);
        exit;
    }

    $sql = "SELECT TOP 1 * FROM fogshield_dealer_users WHERE mobile_number = ? AND password = ?";
    $params = [$mobile, $pass];

    $stmt = sqlsrv_query($con, $sql, $params);

    if ($stmt && sqlsrv_has_rows($stmt)) {
        $row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC);
        $user_id = $row['id'];

        if (!empty($dev_id)) {
            $ins_sql = "INSERT INTO tbl_device_tokens (user_id, device_token) VALUES (?, ?)";
            $ins_params = [$user_id, $dev_id];
            sqlsrv_query($con, $ins_sql, $ins_params);
        }

        if(isset($row['created_at']) && $row['created_at'] instanceof DateTime) {
            $row['created_at'] = $row['created_at']->format('Y-m-d H:i:s');
        }
        if(isset($row['updated_at']) && $row['updated_at'] instanceof DateTime) {
            $row['updated_at'] = $row['updated_at']->format('Y-m-d H:i:s');
        }

        $token = bin2hex(random_bytes(16));

        echo json_encode([
            "status" => true,
            "msg" => "Login Successful",
            "data" => $row,
            "token" => $token
        ]);

    } else {
        echo json_encode(["status" => false, "msg" => "Invalid Mobile or Password"]);
    }
} else {
    echo json_encode(["status" => false, "msg" => "Invalid Request Method"]);
}
?>