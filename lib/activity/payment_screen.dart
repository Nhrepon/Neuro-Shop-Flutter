import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, required this.paymentAmount});

  static const String name = '/payment';

  final double paymentAmount;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late InAppWebViewController webViewController;

  @override
  Widget build(BuildContext context) {
    // ✅ REQUIRED fields according to SSLCommerz documentation
    final postData = {
      // Store credentials
      'store_id': 'teamr600c004f8da4d',
      'store_passwd': 'teamr600c004f8da4d@ssl',

      // Transaction details
      'total_amount': widget.paymentAmount.toStringAsFixed(2),
      'currency': 'BDT',
      'tran_id': 'TXN_${DateTime.now().millisecondsSinceEpoch}', // Unique ID

      // ✅ Customer information
      'cus_name': 'John Doe',
      'cus_email': 'john@example.com',
      'cus_add1': 'House 123, Road 4',
      'cus_add2': 'Block B',
      'cus_city': 'Dhaka',
      'cus_state': 'Dhaka',
      'cus_postcode': '1207',
      'cus_country': 'Bangladesh',
      'cus_phone': '01700000000',
      'cus_fax': '01700000000',

      // ✅ Shipping information (optional if shipping_method = NO)
      'shipping_method': 'NO',
      'num_of_item': '1',

      // ✅ Product information (REQUIRED)
      'product_name': 'Neural Quotes Premium Pack',
      'product_category': 'Digital',
      'product_profile': 'general', // Can be general, physical-goods, non-physical-goods, travel, telecom, others
    };

    final postBody = postData.entries
        .map((e) => '${e.key}=${Uri.encodeComponent(e.value)}')
        .join('&');

    return Scaffold(
      appBar: AppBar(title: const Text("SSLCommerz Payment")),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri("https://sandbox.sslcommerz.com/gwprocess/v4/api.php"),
          method: 'POST',
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
          body: Uint8List.fromList(utf8.encode(postBody)),
        ),
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        onLoadStop: (controller, url) async {
          final htmlContent = await controller.evaluateJavascript(
              source: "document.body.innerText;"
          );
          debugPrint("🔍 Raw HTML/JSON:\n$htmlContent");

          try {
            final jsonResponse = jsonDecode(htmlContent!);
            debugPrint("✅ Status: ${jsonResponse['status']}");
            debugPrint("📍 Reason: ${jsonResponse['failedreason'] ?? 'No error'}");

            final gatewayUrl = jsonResponse['GatewayPageURL'];
            if (gatewayUrl != null && gatewayUrl.isNotEmpty) {
              debugPrint("🌐 Redirecting to Gateway URL: $gatewayUrl");

              // Redirect user to the payment page
              await controller.loadUrl(
                urlRequest: URLRequest(url: WebUri(gatewayUrl)),
              );
            }
          } catch (e) {
            debugPrint("⚠️ Failed to parse JSON: $e");
          }
        },
        onConsoleMessage: (controller, message) {
          debugPrint("📦 WebView Console: ${message.message}");
        },
      ),
    );
  }
}
