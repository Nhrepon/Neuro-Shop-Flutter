import 'dart:convert'; // For utf8
import 'dart:typed_data'; // For Uint8List
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
  //WebUri initUrl = 'https://sandbox.sslcommerz.com/gwprocess/v4/api.php' as WebUri;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter WebView POST Example")),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri("https://sandbox.sslcommerz.com/gwprocess/v4/api.php"), // Replace with your URL
          method: 'POST',
          body: Uint8List.fromList(
        utf8.encode("store_id=teamr600c004f8da4d&store_passwd=teamr600c004f8da4d@ssl&total_amount=${widget.paymentAmount}&currency=BDT&tran_id=1122"), // Replace with your POST data
      ),
    ),
    onWebViewCreated: (controller) {
          webViewController = controller;
        },
      ),
    );
  }
}


