import 'package:flutter/material.dart';
import 'package:food_delivery/resources/services/OrderService.dart';
import 'package:food_delivery/ui/widgets/order.dart';

class OrderHistoryScreen extends StatefulWidget {
  static String id = 'order_history_screen';
  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black.withOpacity(0.04),
        body: RefreshIndicator(
          child: SafeArea(
            child: FutureBuilder(
              builder: (context, snapshot) {
                if ((snapshot.connectionState != ConnectionState.done) &&
                    snapshot.hasData == false) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.green,
                    ),
                  );
                }else if(snapshot.connectionState != ConnectionState.waiting && snapshot.hasData ==false){
                  return Center(
                    child: Text("Order history is empty"),
                  );
                }
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: 2,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          print(snapshot.data);
                          print('Order history is loading');
                          // Order order = snapshot.data.order;
                          return Order();
                        },
                      ),
                    ),
                  ],
                );
              },
              future: getOrder(),
            ),
          ),
          onRefresh: _onRefresh,
        ));
  }

  Future<Null> _onRefresh() async {
    setState(() {});
    await Future.delayed(Duration(seconds: 1));
    return null;
  }
}

