import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:fogshield_dealer_connect/core/database/app_database.dart';

class PdfService {
  /// NEW METHOD: Generates PDF using database models instead of session state
  static Future<Uint8List> generateQuotationPdfFromDb(
      Quotation quote,
      List<QuotationItem> items,
      ) async {
    final pdf = pw.Document();

    // Load app icon
    final logoBytes = await rootBundle.load('assets/icons/app_icon.png');
    final logo = pw.MemoryImage(logoBytes.buffer.asUint8List());

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(40),
        build: (context) => [
          /// HEADER
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Image(logo, width: 70),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Text('QUOTATION', style: pw.TextStyle(fontSize: 22, fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(height: 6),
                  pw.Text('Date: ${_formatDate(quote.createdAt)}', style: const pw.TextStyle(fontSize: 10)),
                  pw.Text('Quote #: ${quote.id}', style: const pw.TextStyle(fontSize: 10)),
                ],
              ),
            ],
          ),

          pw.SizedBox(height: 35),

          /// CUSTOMER INFO
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('BILL TO:', style: pw.TextStyle(fontSize: 11, fontWeight: pw.FontWeight.bold)),
              pw.Text(quote.customerName, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.Text('Phone: ${quote.phoneNumber}'),
              if (quote.gstNumber != null) pw.Text('GST: ${quote.gstNumber}'),
            ],
          ),

          pw.SizedBox(height: 35),

          /// TABLE
          pw.Table(
            border: pw.TableBorder(horizontalInside: pw.BorderSide(color: PdfColors.grey300)),
            children: [
              _tableHeader(),
              ...items.map((item) {
                return pw.TableRow(
                  children: [
                    _cell(item.productModel),
                    _cell(item.quantity.toString(), align: pw.TextAlign.center),
                    _cell('INR ${item.priceAtTimeOfSale.toStringAsFixed(0)}', align: pw.TextAlign.right),
                    _cell('INR ${(item.quantity * item.priceAtTimeOfSale).toStringAsFixed(0)}', align: pw.TextAlign.right),
                  ],
                );
              }).toList(),
            ],
          ),

          pw.SizedBox(height: 20),

          /// TOTAL
          pw.Align(
            alignment: pw.Alignment.centerRight,
            child: pw.Container(
              width: 200,
              padding: const pw.EdgeInsets.all(10),
              color: PdfColors.black,
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('Grand Total', style: pw.TextStyle(color: PdfColors.white, fontWeight: pw.FontWeight.bold)),
                  pw.Text('INR ${quote.totalAmount.toStringAsFixed(0)}', style: pw.TextStyle(color: PdfColors.white, fontWeight: pw.FontWeight.bold)),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    return pdf.save();
  }

  static pw.TableRow _tableHeader() {
    return pw.TableRow(
      decoration: const pw.BoxDecoration(color: PdfColors.black),
      children: [
        _headerCell('Product Model'),
        _headerCell('Qty', align: pw.TextAlign.center),
        _headerCell('Unit Price', align: pw.TextAlign.right),
        _headerCell('Total', align: pw.TextAlign.right),
      ],
    );
  }

  static pw.Widget _headerCell(String text, {pw.TextAlign align = pw.TextAlign.left}) {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(8),
      child: pw.Text(text, textAlign: align, style: pw.TextStyle(color: PdfColors.white, fontWeight: pw.FontWeight.bold, fontSize: 10)),
    );
  }

  static pw.Widget _cell(String text, {pw.TextAlign align = pw.TextAlign.left}) {
    return pw.Padding(padding: const pw.EdgeInsets.all(8), child: pw.Text(text, textAlign: align, style: const pw.TextStyle(fontSize: 10)));
  }

  static String _formatDate(DateTime date) => '${date.day}/${date.month}/${date.year}';
}