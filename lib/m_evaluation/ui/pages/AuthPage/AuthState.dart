class AuthState {
  bool isLoading;
  int phaseId;

  AuthState({
    this.isLoading=false,
    this.phaseId = 1
  });

  AuthState copyWith({
    bool? isLoading,
    int? phaseId
  }) =>
      AuthState(
        isLoading: isLoading ?? this.isLoading,
        phaseId: phaseId ?? this.phaseId,
      );
}