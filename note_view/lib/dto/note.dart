class Note {
  final String id;
  final String title;
  final String description;
  final String payload;
  final Map<String, String> attributes;

  Note(
      {required this.id,
      required this.title,
      required this.description,
      required this.payload,
      required this.attributes});

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        payload: json['payload'],
        attributes: json['attributes']);
  }
}
