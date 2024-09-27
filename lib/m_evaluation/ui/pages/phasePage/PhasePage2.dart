import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../navigation/routers.dart';
import '../../composants/AppSize.dart';
import '../../composants/afficherMessageInfo.dart';
import 'PhaseCtrl.dart';

class PhasePage2 extends ConsumerStatefulWidget {
  const PhasePage2({super.key});

  @override
  ConsumerState<PhasePage2> createState() => _PhaseState2();
}

class _PhaseState2 extends ConsumerState<PhasePage2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var ctrl = ref.read(phaseCtrlProvider.notifier);
      ctrl.recupererPhase();

      var ctrl2 = ref.read(phaseCtrlProvider.notifier);
      ctrl2.recupererListPhase();
      var ctrl3 = ref.read(phaseCtrlProvider.notifier);
      ctrl3.bloquerStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Competition"),
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
                        context, "Deconnexion", Colors.red, true);
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.logout_outlined,
                        color: Colors.white,
                        size: 25,
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
      body: SafeArea(
          child: Stack(
            children: [
              _chargement(context, ref),
              _contenuPrincipale(context, ref),
            ],
          )),
    );
  }

  _chargement(BuildContext context, WidgetRef ref) {
    bool isDarkTheme = Theme
        .of(context)
        .brightness == Brightness.dark;
    Color loadingColor = isDarkTheme ? Colors.white : Colors.orange;
    var state = ref.watch(phaseCtrlProvider);
    return Visibility(
        visible: state.isLoading,
        child: Center(
            child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    size: 50, color: loadingColor),
              ),
            )));
  }

  _contenuPrincipale(BuildContext contect, WidgetRef ref) {
    bool isDarkTheme = Theme
        .of(context)
        .brightness == Brightness.dark;
    Color loadingColor = isDarkTheme ? Colors.white.withOpacity(0.9) : Colors.black.withOpacity(0.1);
    var state = ref.watch(phaseCtrlProvider);
    var phase = state.phasename;
    return Container(
      padding: EdgeInsets.all(30),
      height: AppSize.screenHeight,
      width: AppSize.screenWidth,
      decoration: BoxDecoration(
          image: DecorationImage(
            onError: (exception, stackTrace) => Image.asset("images/jm.png"),
            image: AssetImage("images/idea.png"),
            fit: BoxFit.cover,
          )),

             child: SingleChildScrollView(
               child: Container(
                 margin:AppSize.screenHeight > 900 ? EdgeInsets.only(top: 180) : EdgeInsets.only(top: 90),
                 padding: EdgeInsets.all(40),
                 width: AppSize.screenWidth ,
                 decoration: BoxDecoration(
                   color: loadingColor,
                     borderRadius: BorderRadius.circular(20)
                 ),
                 child:
                     Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Text("${phase?.phase?.nom}",
                             style: TextStyle(
                               color: Colors.black,
                                 fontSize: 30,
                                 fontFamily: "Poppins",
                                 fontWeight: FontWeight.w600,
                                 height: 1.1)
                           ),
                           const SizedBox(height: 16,),
                           Text("${phase?.phase?.description}",
                           style: TextStyle(
                             color: Colors.black,
                           ),
                           ),
                           const SizedBox(height: 16,),
                 Container(
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 SizedBox(
                                   width: 8,
                                 ),
                                 Container(
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
                                           "Commencer le vote ",
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
                             )
                 )
                       ],
                     )

               ),
             ),

    );
  }
}
