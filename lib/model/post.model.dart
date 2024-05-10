class PostModel {
  final String? postParentId;
  final String? groupId;
  final String? groupName;
  final String? content;
  final String? memberId;
  final String? memberName;
  final String? id;
  final String? title;
  final String? createdBy;
  final String? createdDate;
  final String? modifiedBy;
  final String? modifiedDate;
  final bool? delete;
  final int? state;

  Map<String, dynamic> toMap() {
    return {
      'postParentId': postParentId,
      'groupId': groupId,
      'groupName': groupName,
      'content': content,
      'memberId': memberId,
      'memberName': memberName,
      'id': id,
      'title': title,
      'createdBy': createdBy,
      'createdDate': createdDate,
      'modifiedBy': modifiedBy,
      'modifiedDate': modifiedDate,
      'delete': delete,
      'state': state,
    };
  }

  factory PostModel.fromMap(dynamic map) {
    var temp;
    return PostModel(
      postParentId: map['postParentId']?.toString(),
      groupId: map['groupId']?.toString(),
      groupName: map['groupName']?.toString(),
      content: map['content']?.toString(),
      memberId: map['memberId']?.toString(),
      memberName: map['memberName']?.toString(),
      id: map['id']?.toString(),
      title: map['title']?.toString(),
      createdBy: map['createdBy']?.toString(),
      createdDate: map['createdDate']?.toString(),
      modifiedBy: map['modifiedBy']?.toString(),
      modifiedDate: map['modifiedDate']?.toString(),
      delete: null == (temp = map['delete']) ? null : (temp is bool ? temp : (temp is num ? 0 != temp.toInt() : ('true' == temp.toString()))),
      state: null == (temp = map['state']) ? null : (temp is num ? temp.toInt() : int.tryParse(temp)),
    );
  }
  PostModel({
    this.postParentId,
    this.groupId,
    this.groupName,
    this.content,
    this.memberId,
    this.memberName,
    this.id,
    this.title,
    this.createdBy,
    this.createdDate,
    this.modifiedBy,
    this.modifiedDate,
    this.delete,
    this.state,
  });
}
