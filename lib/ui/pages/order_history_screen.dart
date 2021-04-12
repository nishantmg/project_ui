import 'package:flutter/material.dart';
import 'package:food_delivery/models/orderItem.dart';
import 'package:food_delivery/resources/services/OrderService.dart';
import 'package:food_delivery/ui/widgets/order_container.dart';
import 'package:food_delivery/ui/widgets/order_item_card.dart';
import 'package:intl/intl.dart';

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
                // var date = new DateTime.fromMicrosecondsSinceEpoch((snapshot.data[0].createdAt).microsecondsSinceEpoch);
                List results =[];
                List products = results.reversed.toList();
                for(int i = 0 ; i < (snapshot.data.length);i++){
                  var product = new Map<String,dynamic>();
                  getItems(){
                    List items =[];
                    for(int j =0;  j < snapshot.data[i].orderItems.length;j++ ){
                      items.add(snapshot.data[i].orderItems[j].product.productName);
                    }
                    return items;
                  }
                  var parsedDate = DateTime.parse(snapshot.data[i].createdAt);
                  var dateTime = DateFormat('yyyy-MM-dd – kk:mm').format(parsedDate);
                  // var dateTime = DateFormat('yyyy-MM-dd').format(parsedDate);
                  product['orderStatus'] = snapshot.data[i].orderStatus;
                  product['orderItem'] = getItems();
                  product['dateTime'] = dateTime;
                  products.add(product);
                }
                print(products);
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        reverse: true,
                        controller: ScrollController(initialScrollOffset: (products.length).toDouble()),
                        itemCount: products.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          String orderStatus = products[index]["orderStatus"];
                          List orderItem = products[index]["orderItem"];
                          String dateTime = products[index]["dateTime"];
                          return OrderContainer(orderItems: orderItem,orderStatus: orderStatus, dateTime: dateTime);
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

