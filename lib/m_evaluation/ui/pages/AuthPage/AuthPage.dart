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
        height: 100,
      ),
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
            controller: emailCtrl,
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
              suffixIcon: IconButton(
                  onPressed: () async {
                    var result = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ScanCouponPage()),
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
    );
  }

  _envoyer(BuildContext Context) {
    return Container(
        width: double.infinity,
        child: ElevatedButton(
          //style: style,
          onPressed: () async {
            var ctrl = ref.read(authCtrlProvider.notifier);
            var res = await ctrl.soumettre (emailCtrl.text, couponCtrl.text);
            if (res != null) {
              afficherMessageErreur(context, res);
            }else {
              context.goNamed(Urls.introEvaluation.name);
            }

          },
          child: const Text('Envoyer'),
        ));
  }


}
