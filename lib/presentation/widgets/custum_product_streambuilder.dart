import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitandfresh/data/api/product_api.dart';
import 'package:fitandfresh/presentation/widgets/custom_card.dart';
import 'package:flutter/material.dart';

import '../../data/models/product.dart';
    class CustomStreamBuilder extends StatelessWidget {
      OrderModel orderModel=OrderModel();
      ProductApi productApi=ProductApi();

      Widget widget;
      List orderList;

      CustomStreamBuilder({required this.widget,required this.orderList});

      @override
      Widget build(BuildContext context) {
        return widget;
      }
    }
