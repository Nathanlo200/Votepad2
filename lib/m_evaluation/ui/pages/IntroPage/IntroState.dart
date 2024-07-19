class IntroState {
  bool isLoading;
  String imei;

  IntroState({
    this.isLoading=false,
    this.imei='',
  });

  IntroState copyWith({
    bool? isLoading,
    String? imei,
  }) =>
      IntroState(
        isLoading: isLoading ?? this.isLoading,
        imei: imei ?? this.imei,
      );
}