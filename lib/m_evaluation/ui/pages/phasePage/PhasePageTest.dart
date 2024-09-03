import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../navigation/routers.dart';
import '../../composants/afficherMessageInfo.dart';
import 'PhaseCtrl.dart';

class PhasePageTest extends ConsumerStatefulWidget {
  const PhasePageTest({Key? key}) : super(key: key);

  @override
  ConsumerState<PhasePageTest> createState() => _PhasePageTestState();

}

class _PhasePageTestState extends ConsumerState<PhasePageTest> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var ctrl = ref.read(phaseCtrlProvider.notifier);
      ctrl.recupererPhase();

      var ctrl2 = ref.read(phaseCtrlProvider.notifier);
      ctrl2.recupererListPhase();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: TextButton(
                  onPressed: () {
                    var ctrl = ref.read(phaseCtrlProvider.notifier);
                    ctrl.disconnect();
                    context.goNamed(Urls.Intro.name);
                    afficherMessageInfo(
                        context, "Disconnected", Colors.red, true);
                  },
                  child: Row(
                    children: [
                      Text(
                        "Logout",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.logout_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  )),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffFF7900),
              ),
            ),
          ),
        ],
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            _contenuPrincipale(context, ref),
            // _chargement(context, ref),
            _buttonAction(context,ref)
          ],
        ),
      ),
    );
  }

  _contenuPrincipale(BuildContext context, WidgetRef ref) {
    var state = ref.watch(phaseCtrlProvider);
    var phase = state.phasename;
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(135, 10, 0, 0),
                    width: 300,
                    height: 200,
                    child: Center(
                      child: Image.asset("images/x.png"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
                    width: 600,
                    height: 750,
                    child: Center(
                      child: Image.asset("images/x.png"),
                    ),
                  ),

                  SafeArea(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 260,
                          child: Column(
                            children: [
                              Text(
                                "${phase?.phase?.nom}",
                                style: TextStyle(
                                    fontSize: 70,
                                    fontFamily: "Poppins",
                                    height: 1.2),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16,),
                         Text(
                           "${phase?.phase?.description}",
                            style: TextStyle()),
                      ],
                    ),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  _buttonAction(BuildContext context, WidgetRef ref ) {
    var state = ref.watch(phaseCtrlProvider);
    var phase = state.phasename;
    return Container(
      margin:EdgeInsets.fromLTRB(0.0, 700, 0.0, 0.0),
      child: SizedBox(
        height: 60,
        width: 250,
        child: Stack(
          children: [
            Positioned.fill(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              context.goNamed(Urls.intervenants.name,
                                extra: phase,
                                pathParameters: {
                                  "id": phase!.phase!.id.toString()
                                },
                              );
                            },
                            child: Text(
                              "Start the Vote",
                              style: TextStyle(fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                          Icon(CupertinoIcons.arrow_right, color: Colors.white,),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffFF7900),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
