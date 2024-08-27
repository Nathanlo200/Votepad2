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
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: IconButton(
                onPressed: (){
                  context.goNamed(Urls.Intro.name);
                },
                icon: Icon(Icons.arrow_back_ios_rounded,
                ),
                iconSize: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xffFF7900).withOpacity(0.5),
              ),
            ),
          ),
          foregroundColor: Colors.white,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      SizedBox(height: 80,),
                      Text(
                        "Veuillez saisir le coupon",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "pour acceder au vote",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 15,),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Image.asset(
                      "images/lp.png",
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 70),
                        _coupon(context),
                        const SizedBox(height: 50),
                        _envoyer(context),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
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
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50))),
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFFF7900),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
          ),
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