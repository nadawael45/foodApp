import 'package:fitandfresh/presentation/widgets/address_info.dart';
import 'package:fitandfresh/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textformfield.dart';

class ConfermOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScaffold(
        boolAppBar: true,
          text: 'Address Details',
          prefixIcon: Icons.arrow_back,
          prefixFunction: () {
            Navigator.of(context).pop();
          },


        body: AddressInfo(
          txtBtn: 'Confirm Order ',
        ),
      ),
    );
  }
}
