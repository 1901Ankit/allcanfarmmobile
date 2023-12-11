import 'package:allcanfarmapp/Thankyou.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class OrderDetail extends StatefulWidget {
  final int farm_id;
  final int order;
  final int cost;
  final String crop;
  final double produce;
  final String type;
  final String login_token;
  final String group;
  OrderDetail(this.farm_id, this.order, this.cost, this.crop, this.produce,
      this.type, this.login_token, this.group);
  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  static const platform = const MethodChannel("razorpay_flutter");
  late Razorpay _razorpay;

  @override
  Widget build(BuildContext context) {
    double cost_price = widget.produce * widget.cost * widget.order;
    print(cost_price.round());
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Details"),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart_rounded),
            iconSize: 70,
            color: Colors.green[300],
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              "Order Details",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Item : ${widget.crop}",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Quantity : ${widget.order} ${widget.type == "crop" ? "square metre" : "trees"}",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Rate : ₹ ${widget.cost}/kg in sq metre",
            // style: TextStyle(fontSize: 20, color: Colors.blue),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Total Cost : ₹ ${cost_price.toStringAsFixed(2)}",
            // style: TextStyle(fontSize: 20, color: Colors.blue),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 45,
            width: 100,
            child: ElevatedButton(
                onPressed: () {
                  openCheckout();
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => ThankYou()),
                  // );
                },
                child: Text("Pay Now")),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    double cost_price = widget.produce * widget.cost * widget.order;
    int cost = cost_price.toInt();
    var options = {
      'key': 'rzp_test_77nNQPpF7quU1O',
      'amount': cost * 100,
      'name': 'All Can Farm Product',
      'description': 'wheat',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '8527348923', 'email': 'test@razorpay.com'},
      // 'external': {
      //   'wallets': ['paytm']
      // }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Success Response: $response');
    adopt(context, widget.login_token, widget.farm_id, widget.type,
        widget.order, widget.group);

    // /*Fluttertoast.showToast(
    //     msg: "SUCCESS: " + response.paymentId!,
    //     toastLength: Toast.LENGTH_SHORT); */
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Error Response: $response');
    /* Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT); */
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
    /* Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT); */
  }

  Future adopt(BuildContext context, String login_token, int farm_id,
      String type, int order, String group) async {
    // _isloading = false;
    final response = await http.post(
      Uri.parse('http://18.138.159.120/api/adopt-farm'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $login_token',
      },
      body: jsonEncode({
        'farm_id': farm_id,
        'type': type,
        '${type == "crop" ? "area" : "tree"}': order,
      }),
    );
    print(login_token);

    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);
      var resp = res["response"];
      var message = resp["message"];
      print(res);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ThankYou(login_token, group)),
      );
    } else {
      throw Exception('Failed to create album.');
    }
  }
}
