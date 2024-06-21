import '../../../business/model/Vote/intervenants.dart';

class IntervenantState {
  List<Intervenants> intervenants;
  List<Intervenants> intervenantsOrigin;
  bool isLoading;

  IntervenantState({
    this.isLoading=false,
    this.intervenants = const [],
    this.intervenantsOrigin = const [],
  });

  IntervenantState copyWith({
    bool? isLoading,
    List<Intervenants>? intervenants,
    List<Intervenants>? intervenantsOrigin,
  }) =>
      IntervenantState(
        isLoading: isLoading ?? this.isLoading,
        intervenants: intervenants ?? this.intervenants,
        intervenantsOrigin: intervenantsOrigin ?? this.intervenantsOrigin,
      );
}