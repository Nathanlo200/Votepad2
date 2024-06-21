import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:odc_mobile_project/m_user/ui/pages/login/LoginCtrl.dart';
import 'package:odc_mobile_project/navigation/routers.dart';

import '../../composants/afficherMessageErreur.dart';
import '../AuthPage/AuthCtrl.dart';
import '../ScanCouponPage/ScanCouponPage.dart';
import 'IntroCtrl.dart';

class IntroPage extends ConsumerStatefulWidget {
  const IntroPage({super.key});

  @override
  ConsumerState createState() => _IntroPageState();
}

class _IntroPageState extends ConsumerState<IntroPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("init intro page");

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // action initiale de la page et appel d'un controleur
      var ctrl = ref.read(loginCtrlProvider.notifier);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _contenuPrincipale(context),
          _chargement(context),
        ],
      ),
    );
  }

  _contenuPrincipale(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _logoJury(context),
          _boutonVote(),
          const SizedBox(height: 30),
          _separateurOu(),
          const SizedBox(height: 30),
          _boutonEvaluation(),
          _logoEvaluation(context),

        ],
      ),
    );
  }

  _logoJury(BuildContext context) {
    return Center(
      child: Image.asset(
        'images/jury.png',
        width: 100,
        height: 100,
      ),
    );
  }

  _logoEvaluation(BuildContext context) {
    return Center(
      child: Image.asset(
        'images/evaluation.png',
        width: 100,
        height: 100,
      ),
    );
  }

  _boutonVote() {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 80),
      width: double.infinity,
      child: ElevatedButton(
        style: style,
        onPressed: () async {
          var result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ScanCouponPage()),
          );
          if (result != null) {
            print("result dans login $result");
            var ctrl = ref.read(introCtrlProvider.notifier);
            var res = await ctrl.soumettre("coupon");
            if (res) {
              context.goNamed(Urls.phases.name);
            } else {
              afficherMessageErreur(context,"Coupon invalide");
            }
          }
        },
        child: const Text('voter'),
      ),
    );
  }

  _boutonEvaluation() {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      width: double.infinity,
      child: ElevatedButton(
        style: style,
        onPressed: () {
          context.goNamed(Urls.evaluationAuth.name);},
        child: const Text('Passer une evaluation'),
      ),
    );
  }

  _separateurOu() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Divider(
              color: Colors.grey,
              thickness: 1,
              height: 1,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text("OU"),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Divider(
              color: Colors.grey,
              thickness: 1,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }

  _chargement(BuildContext context) {
    var state = ref.watch(introCtrlProvider);
    return Visibility(
        visible: state.isLoading, child: CircularProgressIndicator());
  }
}
