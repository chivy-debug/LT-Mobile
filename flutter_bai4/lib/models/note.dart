class Note {
  int? id;
  String title;
  String content;
  DateTime createdAt;
  String? createdBy; // Thêm thuộc tính để lưu người tạo ghi chú

  Note({
    this.id,
    required this.title,
    required this.content,
    DateTime? createdAt,
    this.createdBy,
  }) : this.createdAt = createdAt ?? DateTime.now();

  // Phương thức để chuyển đối tượng thành Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'createdAt': createdAt.toIso8601String(),
      'createdBy': createdBy, // Lưu tên người tạo
    };
  }

  // Phương thức tạo đối tượng từ Map
  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      createdAt: DateTime.parse(map['createdAt']),
      createdBy: map['createdBy'], // Lấy thông tin người tạo từ Map
    );
  }

  // Phương thức copyWith để tạo bản sao với giá trị mới
  Note copyWith({
    int? id,
    String? title,
    String? content,
    DateTime? createdAt,
    String? createdBy,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      createdBy: createdBy ?? this.createdBy,
    );
  }
}
