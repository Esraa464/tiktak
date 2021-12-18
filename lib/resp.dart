import 'package:flutter/material.dart';


class Test extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var height=  MediaQuery.of(context).size.height;
    var width=  MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: ElevatedButton(child: Text('jjj'),onPressed: (){
          print(height.toString());
          print(width.toString());

        },),
      ),
    );
  }
}
