<?php
include("../common/db.php");

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] == "POST") {

    // 1. Receive Parameters (Matching Flutter App Keys)
    $mobile = $_POST['mobile'] ?? '';  // App sends 'mobile'
    $pass   = $_POST['pass'] ?? '';    // App sends 'pass'
    $dev_id = $_POST['dev_id'] ?? '';  // App sends 'dev_id'

    if (empty($mobile) || empty($pass)) {
        echo json_encode(["status" => false, "msg" => "Mobile and Password required"]);
        exit;
    }

    // 2. Query Database
    // Using TOP 1 to ensure we just get one record
    $sql = "SELECT TOP 1 * FROM fogshield_dealer_users WHERE mobile_number = ? AND password = ?";
    $params = [$mobile, $pass];

    $stmt = sqlsrv_query($con, $sql, $params);

    if ($stmt && sqlsrv_has_rows($stmt)) {
        $row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC);

        $user_id = $row['id'];

        // 3. Update Device Token (if dev_id is provided)
        if (!empty($dev_id)) {
            // Check if token entry exists for this user/device combination if needed,
            // or just insert as a log of logins.
            // Assuming tbl_device_tokens schema: (user_id, device_token)
            $ins_sql = "INSERT INTO tbl_device_tokens (user_id, device_token) VALUES (?, ?)";
            $ins_params = [$user_id, $dev_id];
            sqlsrv_query($con, $ins_sql, $ins_params);
        }

        // 4. Handle Dates for JSON
        if(isset($row['created_at']) && $row['created_at'] instanceof DateTime) {
            $row['created_at'] = $row['created_at']->format('Y-m-d H:i:s');
        }
        if(isset($row['updated_at']) && $row['updated_at'] instanceof DateTime) {
            $row['updated_at'] = $row['updated_at']->format('Y-m-d H:i:s');
        }

        // 5. Generate Token (Optional - if JwtGenerator class exists)
        $token = "";
        if (class_exists('JwtGenerator')) {
            $jwtGenerator = new JwtGenerator();
            $token = $jwtGenerator->generateToken($row);
        } else {
            // Simple session token if JWT class missing
            $token = bin2hex(random_bytes(16));
        }

        echo json_encode([
            "status" => true,
            "msg" => "Login Successful",
            "data" => $row,
            "token" => $token
        ]);

    } else {
        echo json_encode([
            "status" => false,
            "msg" => "Invalid Mobile or Password"
        ]);
    }
} else {
    echo json_encode(["status" => false, "msg" => "Invalid Request Method"]);
}
?>