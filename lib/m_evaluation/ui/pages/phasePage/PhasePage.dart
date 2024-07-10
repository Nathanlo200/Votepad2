import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:odc_mobile_project/m_evaluation/ui/composants/ListeVide.dart';
import 'package:odc_mobile_project/m_evaluation/ui/pages/phasePage/PhaseCtrl.dart';
import '../../../../navigation/routers.dart';

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
    var state = ref.watch(phaseCtrlProvider);
    print("count ${state.phases.length}");
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              if (state.phases.isNotEmpty && !state.isLoading)
                _contenuPrincipale(context, ref)
              else
                ListeVide(context, () {
                  var ctrl = ref.read(phaseCtrlProvider.notifier);
                  ctrl.recupererListPhase();
                }),
              _chargement(context, ref),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Competition"),
          leadingWidth: 0,
          leading: Container(
            child: Builder(builder: (context) {
              // const ;
              return Container();
            }),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  context.goNamed(Urls.info.name);
                },
                icon: Icon(Icons.info)),
            IconButton(
                onPressed: () {
                  context.goNamed(Urls.Intro.name);
                },
                icon: Icon(Icons.logout_outlined)),
          ],
        ));
  }
}

_contenuPrincipale(BuildContext context, WidgetRef ref) {
  var state = ref.watch(phaseCtrlProvider);
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            "Phases : ${state.phases.length}",
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
            child: ListView.separated(
                separatorBuilder: (ctx, index) {
                  return Divider(
                    thickness: 1,
                  );
                },
                itemCount: state.phases.length,
                itemBuilder: (ctx, index) {
                  var phase = state.phases[index];
                  return Card(
                      color: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        leading: Icon(Icons.ac_unit_outlined),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          context.goNamed(Urls.intervenants.name,
                              extra: phase,
                              pathParameters: {
                                "id": phase.phases!.id.toString()
                              },
                          );
                        },
                        title: Text(phase.phases?.nom ?? ""),
                        subtitle: Container(
                          //color: Colors.amber,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Statut : ${phase.phases?.statut}"),
                              Text("candidats : ${phase.intervenants}"),
                            ],
                          ),
                        ),
                      ));
                }))
      ],
    ),
  );
}

_chargement(BuildContext context, WidgetRef ref) {
  var state = ref.watch(phaseCtrlProvider);
  return Visibility(
      visible: state.isLoading,
      child: Center(child: CircularProgressIndicator()));
}
