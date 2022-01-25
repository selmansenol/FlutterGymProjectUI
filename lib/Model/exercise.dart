class Exercise {
  late String bodyPart;
  late String equipment;
  late String gifUrl;
  late String id;
  late String name;
  late String target;

  Exercise(
      {required this.bodyPart,
      required this.equipment,
      required this.gifUrl,
      required this.id,
      required this.name,
      required this.target});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['bodyPart'] = bodyPart;
    data['equipment'] = equipment;
    data['gifUrl'] = gifUrl;
    data['id'] = id;
    data['name'] = name;
    data['target'] = target;
    return data;
  }
}
