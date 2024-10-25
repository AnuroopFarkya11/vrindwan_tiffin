class Id {
  int? timestamp;
  DateTime? date;

  Id({
    this.timestamp,
    this.date,
  });

  // From JSON
  factory Id.fromJson(Map<String, dynamic> json) => Id(
    timestamp: json['timestamp'] as int?,
    date: json['date'] != null ? DateTime.parse(json['date']) : null,
  );

  // To JSON
  Map<String, dynamic> toJson() => {
    'timestamp': timestamp,
    'date': date?.toIso8601String(),
  };
}