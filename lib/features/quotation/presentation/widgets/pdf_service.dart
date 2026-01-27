import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:fogshield_dealer_connect/features/cart/presentation/state/cart_state.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/state/quotation_form_state.dart';

class PdfService {
  static Future<Uint8List> generateQuotationPdf(
      QuotationFormState customer,
      CartState cart,
      ) async {
    final pdf = pw.Document();

    // Determine the shipping display values
    final String shippingAddr = customer.sameAsBilling ? customer.billingAddress : customer.shippingAddress;
    final String shippingCity = customer.sameAsBilling ? customer.billingCity : customer.shippingCity;
    final String shippingState = customer.sameAsBilling ? customer.billingState : customer.shippingState;

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return [
            // Header: Company Info
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('FOGSHIELD',
                        style: pw.TextStyle(
                            fontSize: 24,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.blue900)),
                    pw.Text('Professional Security Solutions'),
                  ],
                ),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  children: [
                    pw.Text('QUOTATION',
                        style: pw.TextStyle(
                            fontSize: 20, fontWeight: pw.FontWeight.bold)),
                    pw.Text(
                        'Date: ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}'),
                    pw.Text('Quote #: QT-2026-0082'),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 30),

            // Billing & Shipping Info
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Expanded(
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('BILL TO:',
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold, fontSize: 10)),
                      pw.Text(customer.customerName.isEmpty
                          ? 'N/A'
                          : customer.customerName),
                      if (customer.companyName.isNotEmpty)
                        pw.Text(customer.companyName),
                      pw.Text(customer.billingAddress),
                      pw.Text(
                          '${customer.billingCity}, ${customer.billingState}'),
                      pw.Text('Phone: ${customer.phoneNumber}'),
                    ],
                  ),
                ),
                pw.Expanded(
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('SHIP TO:',
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold, fontSize: 10)),
                      // Instead of "Same as Billing", we show the actual address
                      pw.Text(customer.customerName.isEmpty
                          ? 'N/A'
                          : customer.customerName),
                      pw.Text(shippingAddr),
                      pw.Text('$shippingCity, $shippingState'),
                    ],
                  ),
                ),
              ],
            ),
            pw.SizedBox(height: 30),

            // Products Table
            pw.TableHelper.fromTextArray(
              border: null,
              headerStyle: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold, color: PdfColors.white),
              headerDecoration: const pw.BoxDecoration(color: PdfColors.blue900),
              cellHeight: 30,
              cellAlignments: {
                0: pw.Alignment.centerLeft,
                1: pw.Alignment.center,
                2: pw.Alignment.centerRight,
                3: pw.Alignment.centerRight,
              },
              headerCellDecoration:
              const pw.BoxDecoration(color: PdfColors.blueGrey800),
              headers: ['Product Name', 'Qty', 'Unit Price', 'Total'],
              data: cart.items.map((item) {
                return [
                  item.name,
                  item.quantity.toString(),
                  'INR ${item.price.toStringAsFixed(0)}',
                  'INR ${item.total.toStringAsFixed(0)}',
                ];
              }).toList(),
            ),

            pw.Divider(thickness: 1, color: PdfColors.grey300),

            // Summary Totals
            pw.Row(
              children: [
                pw.Spacer(flex: 2),
                pw.Expanded(
                  flex: 1,
                  child: pw.Column(
                    children: [
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text('Subtotal:'),
                          pw.Text('INR ${cart.subtotal.toStringAsFixed(0)}'),
                        ],
                      ),
                      if (cart.discountAmount > 0)
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text('Discount:'),
                            pw.Text(
                                '-INR ${cart.discountAmount.toStringAsFixed(0)}',
                                style: const pw.TextStyle(
                                    color: PdfColors.green)),
                          ],
                        ),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text('GST (18%):'),
                          pw.Text('INR ${cart.tax.toStringAsFixed(0)}'),
                        ],
                      ),
                      pw.Divider(),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text('Grand Total:',
                              style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 14)),
                          pw.Text('INR ${cart.total.toStringAsFixed(0)}',
                              style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 14,
                                  color: PdfColors.blue900)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            pw.SizedBox(height: 50),
            pw.Text('Terms & Conditions:',
                style:
                pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10)),
            pw.Bullet(text: 'Quotations are valid for 30 days.'),
            pw.Bullet(
                text: 'Standard warranty applicable as per product guidelines.'),
          ];
        },
      ),
    );

    return pdf.save();
  }
}