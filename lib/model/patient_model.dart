class PatientModel {
  final String name;
  final String srn;
  final int latitude;
  final int longitute;
  final bool? isProcced;

  PatientModel(
      {required this.name,
      required this.srn,
      required this.latitude,
      required this.longitute,
      this.isProcced = false});
}
