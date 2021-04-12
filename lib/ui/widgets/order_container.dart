import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/models/orderItem.dart';
import 'package:food_delivery/ui/widgets/SizeConfig.dart';
import 'package:food_delivery/ui/widgets/order_item_card.dart';

class OrderContainer extends StatefulWidget {
  final List orderItems;
  final String orderStatus;
  final String dateTime;

  const OrderContainer(
      {Key key, this.orderItems, this.orderStatus, this.dateTime})
      : super(key: key);

  @override
  _OrderContainerState createState() => _OrderContainerState();
}

class _OrderContainerState extends State<OrderContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.dateTime,
            style: kRobotoTextStyle.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 2 * SizeConfig.textMultiplier,
                color: Colors.black),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget.orderItems.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            String orderStatus = widget.orderStatus;
            String orderItem = widget.orderItems[index];
            return OrderItemCard(
              orderItem: orderItem,
              orderStatus: orderStatus,
            );
          },
        ),
      ],
    );
  }
}
