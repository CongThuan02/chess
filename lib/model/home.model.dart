import 'package:fe/model/replly.model.dart';

class HomeModel {
  final String? id;
  final String? createdBy;
  final String? time;
  final String? content;
  final String? classId;
  final List<RepllyModel>? repply;

  HomeModel copyWith({
    final String? id,
    final String? createdBy,
    final String? time,
    final String? content,
    final String? classId,
    final List<RepllyModel>? repply,
  }) {
    return HomeModel(
      id: id ?? this.id,
      createdBy: createdBy ?? this.createdBy,
      time: time ?? this.time,
      content: content ?? this.content,
      classId: classId ?? this.classId,
      repply: repply ?? this.repply,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'createdBy': createdBy,
      'time': time,
      'content': content,
      'classId': classId,
      'repply': repply?.map((map) => map?.toMap())?.toList() ?? [],
    };
  }

  factory HomeModel.fromMap(dynamic map) {
    var temp;
    return HomeModel(
      id: map['id']?.toString(),
      createdBy: map['createdBy']?.toString(),
      time: map['time']?.toString(),
      content: map['content']?.toString(),
      classId: map['classId']?.toString(),
      repply: null == (temp = map['repply']) ? [] : (temp is List ? temp.map((map) => RepllyModel.fromMap(map)).toList() : []),
    );
  }
  HomeModel({this.id, this.createdBy, this.time, this.content, this.classId, this.repply});
}
