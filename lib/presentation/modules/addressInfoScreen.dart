import 'package:flutter/material.dart';

import '../widgets/address_info.dart';
import '../widgets/custom_scaffold.dart';
import 'package:easy_localization/easy_localization.dart';
class AddressInfoScreen extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScaffold(
        boolAppBar: true,
        text: 'Address Info'.tr(),
        prefixIcon: Icons.arrow_back,
        prefixFunction: () {
          Navigator.of(context).pop();
        },


        body: AddressInfo(
          txtBtn: 'Save'.tr(),
        ), scaffKey: scaffoldKey,
      ),
    );
  }
}
