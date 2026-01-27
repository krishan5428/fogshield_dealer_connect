import 'dart:typed_data';
import 'package:flutter/services.dart';
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

    // Load app icon (logo)
    final logoBytes = await rootBundle.load('assets/icons/app_icon.png');
    final logo = pw.MemoryImage(logoBytes.buffer.asUint8List());

    final shippingAddress =
    customer.sameAsBilling ? customer.billingAddress : customer.shippingAddress;
    final shippingCity =
    customer.sameAsBilling ? customer.billingCity : customer.shippingCity;
    final shippingState =
    customer.sameAsBilling ? customer.billingState : customer.shippingState;

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(40),
        build: (context) => [
          /// ================= HEADER =================
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Image(logo, width: 70),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Text(
                    'QUOTATION',
                    style: pw.TextStyle(
                      fontSize: 22,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.SizedBox(height: 6),
                  pw.Text(
                    'Date: ${_formatDate(DateTime.now())}',
                    style: const pw.TextStyle(fontSize: 10),
                  ),
                  pw.Text(
                    'Quote #: QT-2026-0082',
                    style: const pw.TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ],
          ),

          pw.SizedBox(height: 35),

          /// ================= BILL / SHIP =================
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              _addressBlock(
                title: 'BILL TO:',
                name: customer.customerName,
                company: customer.companyName,
                address: customer.billingAddress,
                cityState:
                '${customer.billingCity}, ${customer.billingState}',
                phone: customer.phoneNumber,
              ),
              pw.SizedBox(width: 30),
              _addressBlock(
                title: 'SHIP TO:',
                name: customer.customerName,
                address: shippingAddress,
                cityState: '$shippingCity, $shippingState',
              ),
            ],
          ),

          pw.SizedBox(height: 35),

          /// ================= PRODUCT TABLE =================
          pw.Table(
            border: pw.TableBorder(
              horizontalInside: pw.BorderSide(color: PdfColors.grey300),
            ),
            columnWidths: {
              0: const pw.FlexColumnWidth(4),
              1: const pw.FlexColumnWidth(1),
              2: const pw.FlexColumnWidth(2),
              3: const pw.FlexColumnWidth(2),
            },
            children: [
              _tableHeader(),
              ...cart.items.map((item) {
                return pw.TableRow(
                  children: [
                    _cell(item.name),
                    _cell(item.quantity.toString(),
                        align: pw.TextAlign.center),
                    _cell(
                      'INR ${item.price.toStringAsFixed(0)}',
                      align: pw.TextAlign.right,
                    ),
                    _cell(
                      'INR ${item.total.toStringAsFixed(0)}',
                      align: pw.TextAlign.right,
                    ),
                  ],
                );
              }).toList(),
            ],
          ),

          pw.SizedBox(height: 20),

          /// ================= TOTALS =================
          pw.Align(
            alignment: pw.Alignment.centerRight,
            child: pw.Container(
              width: 260,
              child: pw.Column(
                children: [
                  _totalRow('Subtotal', cart.subtotal),
                  _totalRow('GST (18%)', cart.tax),
                  pw.Divider(),
                  pw.Container(
                    color: PdfColors.black,
                    padding:
                    const pw.EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    child: pw.Row(
                      mainAxisAlignment:
                      pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text(
                          'Grand Total',
                          style: pw.TextStyle(
                            color: PdfColors.white,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          'INR ${cart.total.toStringAsFixed(0)}',
                          style: pw.TextStyle(
                            color: PdfColors.white,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          pw.SizedBox(height: 40),

          /// ================= TERMS & CONDITIONS =================
          pw.Text(
            'Terms & Conditions:',
            style: pw.TextStyle(
              fontWeight: pw.FontWeight.bold,
              fontSize: 10,
            ),
          ),
          pw.SizedBox(height: 6),

          pw.Bullet(
            text:
            'Trade prices are exclusive of taxes. GST is extra as applicable at the time of billing. '
                'Current GST rate for Fire Alarm Products is 18%.',
            style: const pw.TextStyle(fontSize: 9),
          ),
          pw.Bullet(
            text:
            'Payment terms: 100% advance along with Purchase Order against Proforma Invoice, unless specified otherwise.',
            style: const pw.TextStyle(fontSize: 9),
          ),
          pw.Bullet(
            text:
            'Freight charges are extra at actuals and must be paid in advance or against delivery of goods to the courier company.',
            style: const pw.TextStyle(fontSize: 9),
          ),
          pw.Bullet(
            text:
            'Dispatch period is 7–10 working days from receipt of Purchase Order, unless specified otherwise, '
                'subject to clearance from accounts.',
            style: const pw.TextStyle(fontSize: 9),
          ),
          pw.Bullet(
            text:
            'Transit insurance is 1% of invoice value and covers loss or major damage in transit to the first point of delivery. '
                'No claims for damaged goods will be entertained unless transit insurance has been taken and paid for. '
                'If the customer has their own insurance, all claims must be raised with their respective insurance provider.',
            style: const pw.TextStyle(fontSize: 9),
          ),
          pw.Bullet(
            text:
            'Warranty: Limited warranty against manufacturing defects, subject to warranty conditions, '
                'to be executed at Securico Service Centers at Faridabad or any other location specified by the company. '
                'Warranty duration is specified against each product. N/A indicates not applicable.',
            style: const pw.TextStyle(fontSize: 9),
          ),
          pw.Bullet(
            text:
            'Parts and spares will be provided free of cost during the warranty period if the fault is due to a manufacturing defect. '
                'Service charges will apply after the first year for products under warranty. '
                'For products out of warranty, service charges and parts cost will be applicable. '
                'For assistance, contact service@securicoelectronics.com.',
            style: const pw.TextStyle(fontSize: 9),
          ),
          pw.Bullet(
            text:
            'Prices, specifications, and warranty terms are subject to change without prior notice. E. & O.E.',
            style: const pw.TextStyle(fontSize: 9),
          ),
        ],
      ),
    );

    return pdf.save();
  }

  /// ================= HELPERS =================

  static pw.Widget _addressBlock({
    required String title,
    required String name,
    String? company,
    required String address,
    required String cityState,
    String? phone,
  }) {
    return pw.Expanded(
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            title,
            style: pw.TextStyle(
              fontSize: 11,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(height: 6),
          pw.Text(name, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          if (company != null && company.isNotEmpty) pw.Text(company),
          pw.Text(address),
          pw.Text(cityState),
          if (phone != null) pw.Text('Phone: $phone'),
        ],
      ),
    );
  }

  static pw.TableRow _tableHeader() {
    return pw.TableRow(
      decoration: const pw.BoxDecoration(color: PdfColors.black),
      children: [
        _headerCell('Product Name'),
        _headerCell('Qty', align: pw.TextAlign.center),
        _headerCell('Unit Price', align: pw.TextAlign.right),
        _headerCell('Total', align: pw.TextAlign.right),
      ],
    );
  }

  static pw.Widget _headerCell(
      String text, {
        pw.TextAlign align = pw.TextAlign.left,
      }) {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(8),
      child: pw.Text(
        text,
        textAlign: align,
        style: pw.TextStyle(
          color: PdfColors.white,
          fontWeight: pw.FontWeight.bold,
          fontSize: 10,
        ),
      ),
    );
  }

  static pw.Widget _cell(
      String text, {
        pw.TextAlign align = pw.TextAlign.left,
      }) {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(8),
      child: pw.Text(
        text,
        textAlign: align,
        style: const pw.TextStyle(fontSize: 10),
      ),
    );
  }

  static pw.Widget _totalRow(String label, double value) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 4),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(label),
          pw.Text('INR ${value.toStringAsFixed(0)}'),
        ],
      ),
    );
  }

  static String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
