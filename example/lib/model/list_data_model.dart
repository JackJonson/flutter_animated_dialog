///List data model
class ListDataModel {
  ///Name
  String name;

  ///Value
  String value;

  ListDataModel({required this.name, required this.value});

  @override
  String toString() {
    return name;
  }
}
