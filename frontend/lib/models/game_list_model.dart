class GameListModel {
  final int id;
  final String name;

  GameListModel({
    required this.id,
    required this.name,
  });

  GameListModel copyWith({
    int? id,
    String? name,
  }) {
    return GameListModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory GameListModel.fromMap(Map<String, dynamic> map) {
    return GameListModel(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  @override
  String toString() => 'GameListModel(id: $id, name: $name)';

  @override
  bool operator ==(covariant GameListModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
