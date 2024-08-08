import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:odc_mobile_project/m_evaluation/ui/pages/IntroPage/IntroCtrl.dart';

import '../../../../navigation/routers.dart';
import '../../composants/afficherMessageErreur.dart';

class SaisieCouponPage extends ConsumerStatefulWidget {
  const SaisieCouponPage({super.key});

  @override
  ConsumerState createState() =>  _SaisieCouponPageState();
}

class _SaisieCouponPageState extends ConsumerState<SaisieCouponPage> {
  final couponCtrl = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saisir un Coupon'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _coupon(context),
            SizedBox(height: 30),
            _envoyer(context),
          ],
        ),
      ),
    );

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
          onPressed: () async {
            var ctrl = ref.read(introCtrlProvider.notifier);
            var result = await ctrl.soumettre(couponCtrl.text);
            if (result==null) {
              context.pushNamed(Urls.phases.name);
            }
            else {
              afficherMessageErreur(context,result);
            }
          },
          child: const Text('Envoyer'),
        ));
  }

}