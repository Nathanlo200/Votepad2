import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:odc_mobile_project/m_evaluation/ui/pages/phasePage/PhaseCtrl.dart';

import '../../../../navigation/routers.dart';
import 'PhaseState.dart';

class PhasePage extends ConsumerStatefulWidget {
  const PhasePage({super.key});

  @override
  ConsumerState<PhasePage> createState() => _PhaseState();
}

class _PhaseState extends ConsumerState<PhasePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var ctrl = ref.read(phaseCtrlProvider.notifier);
      ctrl.recupererListPhase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
             _contenuPrincipale(context, ref),
             _chargement(context, ref)
            ],
          ),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Competition"),
          leading: Container(
            child: Builder(builder: (context) {
             // const ;
              return  Container(
             child: ElevatedButton(
                    child: Icon(Icons.arrow_back),
        onPressed: () {
          context.goNamed(Urls.Intro.name);},

                    ),
              );
            }),
          ),
        ));
  }
}

_contenuPrincipale(BuildContext context, WidgetRef ref) {
  var state = ref.watch(phaseCtrlProvider);

  return Column(
    children: [
      Text("Phases", style: TextStyle(fontSize: 30),),
      SizedBox(height: 50,),
      Expanded(
          child: ListView.builder(
              itemCount: state.phases.length,
              itemBuilder: (ctx, index) {
                var phase = state.phases[index];
                return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      title: Text(phase.nom),
                    ));
              }))
    ],
  );
}

_chargement(BuildContext context, WidgetRef ref) {
  var state = ref.watch(phaseCtrlProvider);
  return Visibility(
      visible: state.isLoading,
      child: Center(child: CircularProgressIndicator()));
}

