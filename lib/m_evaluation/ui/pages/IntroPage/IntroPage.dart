import 'package:device_info_plus/device_info_plus.dart';
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
      var ctrl = ref.read(introCtrlProvider.notifier);
      // _getDeviceImei();
      ctrl.getDeviceIdentifier();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(children: <Widget>[
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
      Expanded(
          child: Column(
        children: [_contenuPrincipale(context)],
      ))
    ])));
  }

  _getDeviceImei() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    print('Running on ${androidInfo.data}');
    print("androidInfo ${androidInfo.id}");
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
          Text(
            'Welcome to VotPad!',
            style: TextStyle(height: 10),
          ),
          Text(
            'you can pass an evaluation or give it a vote',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 100),
          _boutonVote(),
          const SizedBox(height: 30),
          _boutonEvaluation(),
        ],
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

  _boutonVote() {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      backgroundColor: Colors.orange,
    );
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 80),
      width: double.infinity,
      child: Column(
        children: [
          ElevatedButton(
            style: style,
            onPressed: () async {
              var result = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ScanCouponPage(type: "vote")),
              );
              if (result != null) {
                //print("result dans login $result");
                var ctrl = ref.read(introCtrlProvider.notifier);
                var res = await ctrl.soumettre("coupon");
                if (res == null) {
                  context.pushNamed(Urls.phases.name);
                } else {
                  afficherMessageErreur(context, "Coupon invalide");
                }
              }
            },
            child: const Text('voter'),
          ),
        ],
      ),
    );
  }

  _boutonEvaluation() {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        backgroundColor: Colors.orange);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      width: double.infinity,
      child: ElevatedButton(
        style: style,
        onPressed: () {
          context.goNamed(Urls.evaluationAuth.name);
        },
        child: const Text('Passer une evaluation'),
      ),
    );
  }

  _chargement(BuildContext context) {
    var state = ref.watch(introCtrlProvider);
    return Visibility(
        visible: state.isLoading, child: CircularProgressIndicator());
  }
}
