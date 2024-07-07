class Comment {
  final String name;
  final String comment;
  final DateTime createdAt;
  final String fanName;
  final String fanReply;
  final DateTime replyCreatedAt;

  Comment({
    required this.name,
    required this.comment,
    required this.createdAt,
    required this.fanName,
    required this.fanReply,
    required this.replyCreatedAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      name: json['name'] ?? '',
      comment: json['comment'] ?? '',
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : DateTime.now(),
      fanName: json['fan_name'] ?? '',
      fanReply: json['fan_reply'] ?? '',
      replyCreatedAt: json['reply_created_at'] != null ? DateTime.parse(json['reply_created_at']) : DateTime.now(),
    );
  }
}
