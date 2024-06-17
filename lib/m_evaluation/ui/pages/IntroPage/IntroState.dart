class IntroState {
  bool isLoading;

  IntroState({
    this.isLoading=false,
  });

  IntroState copyWith({
    bool? isLoading,
  }) =>
      IntroState(
        isLoading: isLoading ?? this.isLoading,
      );
}