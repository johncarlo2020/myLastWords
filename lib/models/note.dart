class Note {
  int? id;
  int? userId;
  String? title;
  String? body;
  DateTime? dateTime;

  Note({
    this.id,
    this.userId,
    this.title,
    this.body,
    this.dateTime,
  });

  //function to convrt json data to notes model
  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['notes']['id'],
      userId: json['notes']['userId'],
      title: json['notes']['title'],
      body: json['notes']['body'],
      dateTime: DateTime.parse(json["dateTime"]),
    );
  }

  // Map<String, dynamic> toMap() => {
  //       "id": id,
  //       "userId": userId,
  //       "title": title,
  //       "body":body,
  //       "dateTime": dateTime?.toIso8601String(),      
  //     };
}
