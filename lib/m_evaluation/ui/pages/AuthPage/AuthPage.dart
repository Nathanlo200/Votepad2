import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:odc_mobile_project/m_evaluation/ui/pages/AuthPage/AuthCtrl.dart';

import '../../../../navigation/routers.dart';
import '../../composants/afficherMessageErreur.dart';
import '../ScanCouponPage/ScanCouponPage.dart';

class AuthPage extends ConsumerStatefulWidget {
  const AuthPage({super.key});

  @override
  ConsumerState<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends ConsumerState<AuthPage> {
  //String resultat = "";
  var couponCtrl = TextEditingController();
  var emailCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.orange, Colors.orangeAccent],
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50))),
          child: Center(
            child: _logo(context),
          ),
        ),
        Column(
          children: [
            const SizedBox(height: 50),
            _email(context),
            const SizedBox(height: 30),
            _coupon(context),
            const SizedBox(height: 50),
            _envoyer(context),
          ],
        )
      ]),
    ));
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

  _texte(context) {
    return Text("Authentification");
  }

  _email(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(children: [
          Column(children: [
            TextFormField(
              controller: emailCtrl,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Entrez Email',
                prefixIcon: Icon(Icons.email),
              ),
            ),
          ]),
        ]));
  }

  _coupon(BuildContext Context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Column(children: [
        Column(
          children: [
            TextFormField(
              controller: couponCtrl,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Entrez le coupon',
                  suffixIcon: IconButton(
                      onPressed: () async {
                        var result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ScanCouponPage(type: "evaluation")),
                        );
                        if (result != null) {
                          print("result dans login $result");
                          setState(() {
                            couponCtrl.text = result;
                          });
                        }
                      },
                      icon: Icon(Icons.camera_alt))),
            ),
          ],
        ),
      ]),
    );
  }

  _envoyer(BuildContext Context) {
    return Container(
        // width: double.infinity,
        // height: 40,
        decoration: BoxDecoration(
            // gradient: LinearGradient(
            //     colors: Colors.accents,
            //     end: Alignment.bottomCenter,
            //     begin: Alignment.topCenter),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50))),
        child: ElevatedButton(
          //style: style,
          onPressed: () async {
            var ctrl = ref.read(authCtrlProvider.notifier);
            var result = await ctrl.soumettre(emailCtrl.text, couponCtrl.text);
            if (result == null) {
              context.goNamed(Urls.introEvaluation.name);
            } else {
              afficherMessageErreur(context, "Email ou Coupon incorrect");
            }
          },
          child: const Text(
            'Envoyer',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ));
  }
}
