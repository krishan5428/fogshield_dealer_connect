import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:fogshield_dealer_connect/core/database/app_database.dart';

class PdfService {
  /// Generates a professional, modern PDF quotation from database records
  static Future<Uint8List> generateQuotationPdfFromDb(
      Quotation quote,
      List<QuotationItem> items,
      ) async {
    final pdf = pw.Document();

    // Load assets
    final logoBytes = await rootBundle.load('assets/icons/app_icon.png');
    final logo = pw.MemoryImage(logoBytes.buffer.asUint8List());

    final double subtotal = quote.totalAmount / 1.18;
    final double gstAmount = quote.totalAmount - subtotal;

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        theme: pw.ThemeData.withFont(
          base: pw.Font.helvetica(),
          bold: pw.Font.helveticaBold(),
        ),
        build: (pw.Context context) => [
          /// --- HEADER SECTION ---
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Image(logo, width: 80),
                  pw.SizedBox(height: 8),
                  pw.Text('FOGSHIELD',
                      style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold, color: PdfColors.grey700)),
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Text('QUOTATION',
                      style: pw.TextStyle(fontSize: 28, fontWeight: pw.FontWeight.bold, color: PdfColors.black)),
                  pw.SizedBox(height: 8),
                  pw.Text('Date: ${_formatDate(quote.createdAt)}', style: const pw.TextStyle(fontSize: 10)),
                  pw.Text('Quote ID: ${quote.id}', style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
                ],
              ),
            ],
          ),

          pw.Divider(thickness: 1, color: PdfColors.grey300, height: 40),

          /// --- ADDRESS SECTION ---
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    _sectionLabel('BILL TO:'),
                    _infoRow('Name: ', quote.customerName),
                    if (quote.companyName.isNotEmpty) _infoRow('Company: ', quote.companyName),
                    _infoRow('Address: ', '${quote.billingAddress}, ${quote.billingCity}, ${quote.billingState} - ${quote.billingPincode}'),
                    _infoRow('Phone: ', quote.phoneNumber),
                    if (quote.gstNumber != null && quote.gstNumber!.isNotEmpty)
                      _infoRow('GST: ', quote.gstNumber!),
                  ],
                ),
              ),
              pw.SizedBox(width: 40),
              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    _sectionLabel('SHIP TO:'),
                    _infoRow('Name: ', quote.customerName),
                    if (!quote.sameAsBilling) ...[
                      _infoRow('Address: ', '${quote.shippingAddress}, ${quote.shippingCity}, ${quote.shippingState} - ${quote.shippingPincode}'),
                    ] else ...[
                      _infoRow('Address: ', '${quote.billingAddress}, ${quote.billingCity}, ${quote.billingState} - ${quote.billingPincode}'),
                    ],
                  ],
                ),
              ),
            ],
          ),

          pw.SizedBox(height: 30),

          /// --- PRODUCT TABLE ---
          pw.Table(
            border: const pw.TableBorder(
              bottom: pw.BorderSide(color: PdfColors.grey400, width: 0.5),
              horizontalInside: pw.BorderSide(color: PdfColors.grey200, width: 0.5),
            ),
            columnWidths: {
              0: const pw.FlexColumnWidth(4),
              1: const pw.FlexColumnWidth(1),
              2: const pw.FlexColumnWidth(2),
              3: const pw.FlexColumnWidth(2),
            },
            children: [
              pw.TableRow(
                decoration: const pw.BoxDecoration(color: PdfColors.black),
                children: [
                  _headerCell('Product Name'),
                  _headerCell('Qty', align: pw.TextAlign.center),
                  _headerCell('Unit Price', align: pw.TextAlign.right),
                  _headerCell('Total', align: pw.TextAlign.right),
                ],
              ),
              ...items.map((item) {
                return pw.TableRow(
                  children: [
                    _cell(item.productModel, padding: 10),
                    _cell(item.quantity.toString(), align: pw.TextAlign.center, padding: 10),
                    _cell('INR ${item.priceAtTimeOfSale.toStringAsFixed(0)}', align: pw.TextAlign.right, padding: 10),
                    _cell('INR ${(item.quantity * item.priceAtTimeOfSale).toStringAsFixed(0)}',
                        align: pw.TextAlign.right, padding: 10, isBold: true),
                  ],
                );
              }).toList(),
            ],
          ),

          pw.SizedBox(height: 15),
          pw.Row(
            children: [
              pw.Spacer(flex: 3),
              pw.Expanded(
                flex: 2,
                child: pw.Column(
                  children: [
                    _summaryRow('Subtotal:', 'INR ${subtotal.toStringAsFixed(0)}'),
                    _summaryRow('GST (18%):', 'INR ${gstAmount.toStringAsFixed(0)}'),
                    pw.SizedBox(height: 8),
                    pw.Container(
                      padding: const pw.EdgeInsets.all(10),
                      decoration: const pw.BoxDecoration(color: PdfColors.blueGrey900),
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text('Grand Total:',
                              style: pw.TextStyle(color: PdfColors.white, fontWeight: pw.FontWeight.bold, fontSize: 12)),
                          pw.Text('INR ${quote.totalAmount.toStringAsFixed(0)}',
                              style: pw.TextStyle(color: PdfColors.white, fontWeight: pw.FontWeight.bold, fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          pw.SizedBox(height: 40),
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Terms & Conditions:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10)),
              pw.SizedBox(height: 8),
              // FIX: Replaced Unicode bullet point with ASCII '-' to prevent renderer errors
              _bulletPoint('Quotations are valid for 30 days.'),
              _bulletPoint('Standard warranty applicable as per product guidelines.'),
              _bulletPoint('Subject to realization of payment.'),
              _bulletPoint('Delivery as per availability.'),
            ],
          ),

          pw.SizedBox(height: 40),
          pw.Align(
            alignment: pw.Alignment.center,
            child: pw.Text('Thank you for choosing FOGSHIELD!',
                style: pw.TextStyle(color: PdfColors.grey500, fontStyle: pw.FontStyle.italic, fontSize: 9)),
          ),
        ],
      ),
    );

    return pdf.save();
  }

  static pw.Widget _infoRow(String label, String value) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 3),
      child: pw.RichText(
        text: pw.TextSpan(
          children: [
            pw.TextSpan(text: label, style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 9)),
            pw.TextSpan(text: value, style: const pw.TextStyle(fontSize: 9)),
          ],
        ),
      ),
    );
  }

  static pw.Widget _sectionLabel(String text) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 6),
      child: pw.Text(text, style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold, color: PdfColors.black)),
    );
  }

  static pw.Widget _headerCell(String text, {pw.TextAlign align = pw.TextAlign.left}) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: pw.Text(text, textAlign: align, style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10, color: PdfColors.white)),
    );
  }

  static pw.Widget _cell(String text, {pw.TextAlign align = pw.TextAlign.left, double padding = 8, bool isBold = false}) {
    return pw.Padding(
      padding: pw.EdgeInsets.all(padding),
      child: pw.Text(
        text,
        textAlign: align,
        style: pw.TextStyle(
            fontSize: 10,
            fontWeight: isBold ? pw.FontWeight.bold : pw.FontWeight.normal
        ),
      ),
    );
  }

  static pw.Widget _summaryRow(String label, String value) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 3, horizontal: 8),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(label, style: const pw.TextStyle(fontSize: 10)),
          pw.Text(value, style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
        ],
      ),
    );
  }

  static pw.Widget _bulletPoint(String text) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 4),
      child: pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          // Using ASCII dash instead of Unicode bullet point for compatibility
          pw.Text('* ', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.Expanded(child: pw.Text(text, style: const pw.TextStyle(fontSize: 9))),
        ],
      ),
    );
  }

  static String _formatDate(DateTime date) => '${date.day}/${date.month}/${date.year}';
}