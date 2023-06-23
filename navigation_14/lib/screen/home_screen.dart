import 'package:flutter/material.dart';
import 'package:navigation_14/layout/main_layout.dart';
import 'package:navigation_14/screen/route_one_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        return false;
        // return true; pop 가능
        // return false; pop 불가능 (시스템 뒤로가기 막기)

        return Navigator.of(context).canPop();


      },
      child: MainLayout(title: "Home Screen", children: [
        ElevatedButton(
            onPressed: () async {
              final result= await Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const RouteOneScreen(
                     number: 123,
                  )));
              print(result);
            },
            child: Text("Push")),
        ElevatedButton(onPressed: (){
          Navigator.of(context).pop();
        }, child: Text('Pop'))
        ,
        ElevatedButton(onPressed: (){
          Navigator.of(context).maybePop();
        }, child: Text('Maybe Pop'))
        ,
        ElevatedButton(onPressed: (){
          print(Navigator.of(context).canPop());

        }, child: Text('Can Pop'))
      ]),
    );
  }
}
