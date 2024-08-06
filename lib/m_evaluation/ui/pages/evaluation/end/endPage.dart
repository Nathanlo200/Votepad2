import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EndPage extends StatelessWidget {
  const EndPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Merci pour votre participation")),
          Center(child: Text("à bientot")),
          SizedBox(height: 18.0,),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
              ),
              onPressed: (){
                SystemNavigator.pop();
              },
              child: Text("Quitter"),
            ),
          )
        ],
      ),
    );
  }
}
