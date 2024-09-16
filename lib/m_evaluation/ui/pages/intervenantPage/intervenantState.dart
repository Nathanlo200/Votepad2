
import '../../../business/model/intervenants.dart';


class IntervenantState {
  List<Intervenants> intervenants;
  List<Intervenants> intervenantsOrigin;
  bool isLoading;
  bool isDone;


  IntervenantState({
    this.isLoading=false,
    this.intervenants = const [],
    this.intervenantsOrigin = const [],
    this.isDone = false,

  });

  get phasesVote => null;

  IntervenantState copyWith({
    bool? isLoading,
    bool? isDone,
    List<Intervenants>? intervenants,

    List<Intervenants>? intervenantsOrigin,
  }) =>
      IntervenantState(
        isLoading: isLoading ?? this.isLoading,
        isDone: isDone ?? this.isDone,
        intervenants: intervenants ?? this.intervenants,
        intervenantsOrigin: intervenantsOrigin ?? this.intervenantsOrigin,
      );
}