import 'package:flutter/material.dart';
class NoInternetDialoge extends StatelessWidget {
  bool? dismiss;
  NoInternetDialoge({Key? key,this.dismiss}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: AlertDialog(
      title:Text( 'No Internet Connection'),
    content: Text( 'No Internet Connection'),
    //  content: Icon(Icons.perm_scan_wifi),

    ), onWillPop: ()async{return dismiss!?true:false;});
  }

}
