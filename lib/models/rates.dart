import 'dart:convert';

class Rates {
  final int id;
  final DateTime date;
  final String abbreviation;
  final double officialRate;

  Rates({
    required this.id,
    required this.date,
    required this.abbreviation,
    required this.officialRate,
  });

  factory Rates.fromMap(Map<String, dynamic> map) {
    return Rates(
      id: map['Cur_ID']?.toInt() ?? 0,
      date: DateTime.parse(map['Date']),
      abbreviation: map['Cur_Abbreviation'] ?? '',
      officialRate: map['Cur_OfficialRate']?.toDouble() ?? 0.0,
    );
  }

  factory Rates.fromJson(String source) => Rates.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Rates(id: $id, date: $date, abbreviation: $abbreviation, officialRate: $officialRate)';
  }
}
