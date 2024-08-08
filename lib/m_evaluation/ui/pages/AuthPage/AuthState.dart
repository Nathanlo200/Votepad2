class AuthState {
  bool isLoading;

  AuthState({
    this.isLoading=false,
  });

  AuthState copyWith({
    bool? isLoading,
  }) =>
      AuthState(
        isLoading: isLoading ?? this.isLoading,
      );
}