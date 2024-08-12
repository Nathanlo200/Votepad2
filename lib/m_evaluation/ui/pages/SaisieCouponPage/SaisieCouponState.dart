class SaisieCouponState {

  bool isLoading;
  String imei = "";


  SaisieCouponState({
    this.isLoading = false,
    this.imei = "",
  });


  SaisieCouponState copyWith({
    bool? isLoading,
    String? imei,
  }) =>
      SaisieCouponState(
        isLoading: isLoading ?? this.isLoading,
        imei: imei ?? this.imei
      );
}