///List data model
class ListDataModel {
  ///Name
  String? name;

  ///Value
  String? value;

  ListDataModel({this.name, this.value});

  @override
  String toString() {
    return name ?? '';
  }
}
