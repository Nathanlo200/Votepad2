import 'package:flutter/material.dart';

import '../ScanCouponPage/ScanCouponPage.dart';


class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  //String resultat = "";
  var couponCtrl= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     //appBar: AppBar(title: _logo(context)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _logo(context),
            _texte(context),
            _email(context),
            const SizedBox(height: 30),
            _coupon(context),
            const SizedBox(height: 100),
            _envoyer(context),
          ],
        ),
      ),
    );
  }

  _logo(BuildContext context) {
    return Center(
        child: Image.asset(
        'images/images.png',
        width: 100,
        height: 100,),
    );
  }

  _texte(context) {
    return Text("Authentification");
  }

  _email(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Entrez Email',
            ),
          ),

        ]);
  }

  _coupon(BuildContext Context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          controller: couponCtrl,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Entrez le coupon',
            suffixIcon: IconButton(onPressed:() async{
              var result= await Navigator.push(context, MaterialPageRoute(builder: (context) => ScanCouponPage()),);
            if(result!=null){
              print("result dans login $result");
              setState(() {
                couponCtrl.text= result;
              }); 
            }
              }, icon: Icon(Icons.camera_alt))
          ),
        ),
      ],
    );
  }

  _envoyer(BuildContext Context) {
    return Container(
      width: double.infinity,
        child: ElevatedButton(
          //style: style,
          onPressed: null,
          child: const Text('Envoyer'),
        )
    );
  }
}