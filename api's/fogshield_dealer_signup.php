<?php
include("../common/db.php");

// --- Logging Function ---
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

    // 1. Receive Parameters (Matching Flutter App Keys)
    $name          = $_POST['name'] ?? '';
    $mobile        = $_POST['mobile'] ?? '';      // App sends 'mobile'
    $email         = $_POST['email'] ?? '';
    $password      = $_POST['password'] ?? '';    // App sends 'password' for signup
    $dealer_code   = $_POST['dealer_code'] ?? '';
    $gst_number    = $_POST['gst_number'] ?? '';
    $address       = $_POST['address'] ?? '';
    $company_name  = $_POST['company_name'] ?? '';

    // Defaults
    $is_admin      = 0;
    $is_registered = 1;
    $created_at    = date('Y-m-d H:i:s');
    $updated_at    = date('Y-m-d H:i:s');

    // Basic Validation
    if (empty($mobile) || empty($password) || empty($dealer_code)) {
        echo json_encode(["status" => false, "msg" => "Missing required fields (mobile, password, dealer_code)"]);
        exit;
    }

    // 2. Check if user already exists
    $checkSql = "SELECT id FROM fogshield_dealer_users WHERE mobile_number = ? OR email = ?";
    $checkParams = [$mobile, $email];
    $checkStmt = sqlsrv_query($con, $checkSql, $checkParams);

    if ($checkStmt && sqlsrv_has_rows($checkStmt)) {
        // --- UPDATE EXISTING USER LOGIC ---
        // If user exists, we update their info instead of creating a duplicate
        $updateSql = "UPDATE fogshield_dealer_users
                      SET name = ?, password = ?, dealer_code = ?, gst_number = ?,
                          address = ?, company_name = ?, updated_at = ?
                      WHERE mobile_number = ?";

        $updateParams = [$name, $password, $dealer_code, $gst_number, $address, $company_name, $updated_at, $mobile];
        $updateStmt = sqlsrv_query($con, $updateSql, $updateParams);

        if ($updateStmt) {
            logToFile("User updated successfully", ['mobile' => $mobile]);
            echo json_encode(["status" => true, "msg" => "Account updated successfully"]);
        } else {
            logToFile("Update failed", ['error' => sqlsrv_errors()]);
            echo json_encode(["status" => false, "msg" => "Failed to update account"]);
        }

    } else {
        // --- INSERT NEW USER LOGIC ---
        $insertSql = "INSERT INTO fogshield_dealer_users
                      (name, mobile_number, email, password, dealer_code, gst_number, address, company_name, is_admin, is_registered, created_at, updated_at)
                      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        $insertParams = [
            $name, $mobile, $email, $password, $dealer_code, $gst_number,
            $address, $company_name, $is_admin, $is_registered, $created_at, $updated_at
        ];

        $insertStmt = sqlsrv_query($con, $insertSql, $insertParams);

        if ($insertStmt) {
            logToFile("New user registered", ['mobile' => $mobile]);
            echo json_encode(["status" => true, "msg" => "User registered successfully"]);
        } else {
            logToFile("Registration failed", ['error' => sqlsrv_errors()]);
            echo json_encode(["status" => false, "msg" => "Database error during registration"]);
        }
    }

} else {
    echo json_encode(["status" => false, "msg" => "Invalid Request Method"]);
}
?>