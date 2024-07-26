import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../navigation/routers.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            IconButton(onPressed: () {
      context.goNamed(Urls.phases.name);
      }, icon: Icon(Icons.arrow_back_ios_new, color: Colors.black,)),
            _logo(context),
            _contenuPrincipale(context),
          ],
        ),
      )
    );
  }
  _contenuPrincipale(BuildContext context) {
    return Column(children:
        [
          Padding(padding: EdgeInsets.symmetric(horizontal: 180, vertical: 100),),
          Text('VotePad', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.amber),),
          SizedBox(height: 10,),
          Text('version 1.0.0 ', style: TextStyle(fontStyle: FontStyle.italic,color: Colors.grey),)
        ]

    );
  }
  _logo(BuildContext context) {
    return Center(
      child: Image.asset(
        'images/images.png',
        width: 100,
        height: 100,
      ),
    );
  }

}