<?php
// CHANGED: used ../../ because we are now inside the 'fogshield_dealer_connect' folder
include("../../common/db.php");

function logSync($message, $data = []) {
    $logFile = __DIR__ . '/dealer_quote_sync_log.txt';
    $timestamp = date('Y-m-d H:i:s');
    $logEntry = "[$timestamp] $message\n";
    if (!empty($data)) {
        $logEntry .= "Data: " . json_encode($data, JSON_PRETTY_PRINT) . "\n";
    }
    $logEntry .= str_repeat('-', 80) . "\n";
    file_put_contents($logFile, $logEntry, FILE_APPEND);
}

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(["status" => false, "msg" => "Invalid Request Method"]);
    exit;
}

$input = file_get_contents('php://input');
$data = json_decode($input, true);

if (!$data) {
    echo json_encode(["status" => false, "msg" => "Invalid JSON payload"]);
    exit;
}

$user_id = $data['user_id'] ?? null;
$quotation_id = $data['quotation_id'] ?? null;
$items = $data['items'] ?? [];

if (empty($user_id) || empty($quotation_id)) {
    echo json_encode(["status" => false, "msg" => "Missing user_id or quotation_id"]);
    exit;
}

if (sqlsrv_begin_transaction($con) === false) {
    echo json_encode(["status" => false, "msg" => "Database error"]);
    exit;
}

try {
    // 1. Fetch Dealer Details
    $dealerSql = "SELECT name, mobile_number FROM fogshield_dealer_users WHERE id = ?";
    $dealerStmt = sqlsrv_query($con, $dealerSql, [$user_id]);
    
    $dealerName = '';
    $dealerMobile = '';
    
    if ($dealerStmt && sqlsrv_has_rows($dealerStmt)) {
        $dRow = sqlsrv_fetch_array($dealerStmt, SQLSRV_FETCH_ASSOC);
        $dealerName = $dRow['name'];
        $dealerMobile = $dRow['mobile_number'];
    }

    $productDetailsJson = json_encode($items);
    $currentTime = date('Y-m-d H:i:s');

    // 2. Upsert Quotation
    $checkSql = "SELECT quotation_id FROM fogshield_dealer_quotations WHERE quotation_id = ?";
    $checkStmt = sqlsrv_query($con, $checkSql, [$quotation_id]);
    $exists = ($checkStmt && sqlsrv_has_rows($checkStmt));

    if ($exists) {
        $sql = "UPDATE fogshield_dealer_quotations SET 
                dealer_name = ?, dealer_mobile = ?,
                customer_name = ?, customer_phone = ?, customer_email = ?, company_name = ?, gst_number = ?, 
                billing_address = ?, billing_city = ?, billing_state = ?, billing_pincode = ?, 
                shipping_address = ?, shipping_city = ?, shipping_state = ?, shipping_pincode = ?, 
                total_amount = ?, product_details = ?, notes = ?, updated_at = ?
                WHERE quotation_id = ?";
        
        $params = [
            $dealerName, $dealerMobile,
            $data['customer_name'] ?? '', $data['customer_phone'] ?? '', $data['customer_email'] ?? '',
            $data['company_name'] ?? '', $data['gst_number'] ?? '',
            $data['billing_address'] ?? '', $data['billing_city'] ?? '', $data['billing_state'] ?? '', $data['billing_pincode'] ?? '',
            $data['shipping_address'] ?? '', $data['shipping_city'] ?? '', $data['shipping_state'] ?? '', $data['shipping_pincode'] ?? '',
            $data['total_amount'] ?? 0.0,
            $productDetailsJson,
            $data['notes'] ?? '',
            $currentTime,
            $quotation_id
        ];
        
        $stmt = sqlsrv_query($con, $sql, $params);
        if ($stmt === false) throw new Exception("Update failed");

    } else {
        $sql = "INSERT INTO fogshield_dealer_quotations (
                    quotation_id, user_id, dealer_name, dealer_mobile,
                    customer_name, customer_phone, customer_email, company_name, gst_number,
                    billing_address, billing_city, billing_state, billing_pincode,
                    shipping_address, shipping_city, shipping_state, shipping_pincode,
                    total_amount, product_details, notes, created_at, updated_at
                ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        $params = [
            $quotation_id, $user_id, $dealerName, $dealerMobile,
            $data['customer_name'] ?? '', $data['customer_phone'] ?? '', $data['customer_email'] ?? '',
            $data['company_name'] ?? '', $data['gst_number'] ?? '',
            $data['billing_address'] ?? '', $data['billing_city'] ?? '', $data['billing_state'] ?? '', $data['billing_pincode'] ?? '',
            $data['shipping_address'] ?? '', $data['shipping_city'] ?? '', $data['shipping_state'] ?? '', $data['shipping_pincode'] ?? '',
            $data['total_amount'] ?? 0.0,
            $productDetailsJson,
            $data['notes'] ?? '',
            $data['created_at'] ?? $currentTime,
            $currentTime
        ];

        $stmt = sqlsrv_query($con, $sql, $params);
        if ($stmt === false) throw new Exception("Insert failed");
    }

    sqlsrv_commit($con);
    logSync("Success: Quote $quotation_id saved.");
    echo json_encode(["status" => true, "msg" => "Quotation saved successfully", "id" => $quotation_id]);

} catch (Exception $e) {
    sqlsrv_rollback($con);
    logSync("Error: " . $e->getMessage());
    echo json_encode(["status" => false, "msg" => "Server Error: " . $e->getMessage()]);
}
?>