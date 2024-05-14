class RepllyModel {
  final String? id;
  final String? createdBy;
  final String? replly;
  final String? time;
  final String? homeId;

  RepllyModel({this.id, this.createdBy, this.replly, this.time, this.homeId});

  RepllyModel copyWith({
    final String? id,
    final String? createdBy,
    final String? replly,
    final String? time,
    final String? homeId,
  }) {
    return RepllyModel(
      id: id ?? this.id,
      createdBy: createdBy ?? this.createdBy,
      replly: replly ?? this.replly,
      time: time ?? this.time,
      homeId: homeId ?? this.homeId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'createdBy': createdBy,
      'replly': replly,
      'time': time,
      'homeId': homeId,
    };
  }

  factory RepllyModel.fromMap(dynamic map) {
    var temp;
    return RepllyModel(
      id: map['id']?.toString(),
      createdBy: map['createdBy']?.toString(),
      replly: map['replly']?.toString(),
      time: map['time']?.toString(),
      homeId: map['homeId']?.toString(),
    );
  }
}
