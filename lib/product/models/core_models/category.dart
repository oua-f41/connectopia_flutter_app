// ignore_for_file: public_member_api_docs, sort_constructors_first
class Category {
  String? _id;

  String? get id => _id;

  set id(String? value) {
    _id = value;
  }

  String? _name;

  String? get name => _name;

  set name(String? value) {
    _name = value;
  }

  Category({String? id, String? name})
      : _name = name,
        _id = id;

  Category copyWith({
    String? id,
    String? name,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
