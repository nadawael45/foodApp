import 'package:flutter/material.dart';

import '../widgets/address_info.dart';
import '../widgets/custom_scaffold.dart';
class AddressInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScaffold(
        boolAppBar: true,
        text: 'Address Info',
        prefixIcon: Icons.arrow_back,
        prefixFunction: () {
          Navigator.of(context).pop();
        },


        body: AddressInfo(
          txtBtn: 'Save ',
        ),
      ),
    );
  }
}
