class JHgDModel {
  final String ttr1;
  final String bbr2;
  final String fadf3;
  final String fff4;
  final bool ggt;
  JHgDModel({
    required this.ttr1,
    required this.bbr2,
    required this.fadf3,
    required this.fff4,
    required this.ggt,
  });

  factory JHgDModel.fromJson(Map<String, dynamic> map) {
    return JHgDModel(
      ttr1: map['ttr1'] as String,
      bbr2: map['bbr2'] as String,
      fadf3: map['fadf3'] as String,
      fff4: map['fff4'] as String,
      ggt: map['ggt'] as bool,
    );
  }

  @override
  String toString() {
    return 'JHgDModel(ttr1: $ttr1, bbr2: $bbr2, fadf3: $fadf3, fff4: $fff4, ggt: $ggt)';
  }
}
