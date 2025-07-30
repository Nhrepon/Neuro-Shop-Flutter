// import 'package:flutter/widgets.dart';
// import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
// import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
// import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
// import 'package:flutter_sslcommerz/sslcommerz.dart';

// void SslcommerzePayment(double amount)async{
//   Sslcommerz sslcommerz = Sslcommerz(
//       initializer: SSLCommerzInitialization(
//           ipn_url: "www.google.com",
//           multi_card_name: "visa,master,bkash",
//           currency: SSLCurrencyType.BDT,
//           product_category: "Software",
//           sdkType: SSLCSdkType.TESTBOX,
//           store_id: "teamr600c004f8da4d",
//           store_passwd: "teamr600c004f8da4d@ssl",
//           total_amount: amount,
//           tran_id: "custom_transaction_id"));
//
//   final response = await sslcommerz.payNow();
//   if(response.status == "VALID"){
//     debugPrint("Payment success!");
//   }else if(response.status == "Closed"){
//     debugPrint("Payment closed!");
//   }else if(response.status == "FAILED"){
//     debugPrint("Payment failed!");
//   }
// }
