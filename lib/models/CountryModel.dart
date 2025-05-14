class CountryModel {
  final bool success;
  final List<String> countries;

  CountryModel({required this.success, required this.countries});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      success: json['success'],
      countries: List<String>.from(json['countries']),
    );
  }
}
