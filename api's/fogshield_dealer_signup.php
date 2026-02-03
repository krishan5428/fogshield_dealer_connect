<?php
// CHANGED: used ../../ because we are now inside the 'fogshield_dealer_connect' folder
include("../../common/db.php");

function logToFile($message, $data = []) {
    $logFile = __DIR__ . '/dealer_signup_log.txt';
    $timestamp = date('Y-m-d H:i:s');
    $logEntry = "[$timestamp] $message\n";
    if (!empty($data)) {
        $logEntry .= "Data: " . json_encode($data, JSON_PRETTY_PRINT) . "\n";
    }
    $logEntry .= str_repeat('-', 80) . "\n";
    file_put_contents($logFile, $logEntry, FILE_APPEND);
}

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $name          = $_POST['name'] ?? '';
    $mobile        = $_POST['mobile'] ?? '';
    $email         = $_POST['email'] ?? '';
    $password      = $_POST['password'] ?? '';
    $dealer_code   = $_POST['dealer_code'] ?? '';
    $gst_number    = $_POST['gst_number'] ?? '';
    $address       = $_POST['address'] ?? '';
    $company_name  = $_POST['company_name'] ?? '';

    $is_admin      = 0;
    $is_registered = 1;
    $created_at    = date('Y-m-d H:i:s');
    $updated_at    = date('Y-m-d H:i:s');

    if (empty($mobile) || empty($password) || empty($dealer_code)) {
        echo json_encode(["status" => false, "msg" => "Missing required fields"]);
        exit;
    }

    $checkSql = "SELECT id FROM fogshield_dealer_users WHERE mobile_number = ? OR email = ?";
    $checkParams = [$mobile, $email];
    $checkStmt = sqlsrv_query($con, $checkSql, $checkParams);

    if ($checkStmt && sqlsrv_has_rows($checkStmt)) {
        $updateSql = "UPDATE fogshield_dealer_users
                      SET name = ?, password = ?, dealer_code = ?, gst_number = ?,
                          address = ?, company_name = ?, updated_at = ?
                      WHERE mobile_number = ?";
        $updateParams = [$name, $password, $dealer_code, $gst_number, $address, $company_name, $updated_at, $mobile];
        $updateStmt = sqlsrv_query($con, $updateSql, $updateParams);

        if ($updateStmt) {
            echo json_encode(["status" => true, "msg" => "Account updated successfully"]);
        } else {
            echo json_encode(["status" => false, "msg" => "Failed to update account"]);
        }
    } else {
        $insertSql = "INSERT INTO fogshield_dealer_users
                      (name, mobile_number, email, password, dealer_code, gst_number, address, company_name, is_admin, is_registered, created_at, updated_at)
                      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        $insertParams = [
            $name, $mobile, $email, $password, $dealer_code, $gst_number,
            $address, $company_name, $is_admin, $is_registered, $created_at, $updated_at
        ];
        $insertStmt = sqlsrv_query($con, $insertSql, $insertParams);

        if ($insertStmt) {
            echo json_encode(["status" => true, "msg" => "User registered successfully"]);
        } else {
            echo json_encode(["status" => false, "msg" => "Database error during registration"]);
        }
    }
} else {
    echo json_encode(["status" => false, "msg" => "Invalid Request Method"]);
}
?>