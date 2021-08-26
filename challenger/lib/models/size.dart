class SizeShoe {
  final int id;
  final int size;

  SizeShoe({
    required this.id,
    required this.size,
  });

  factory SizeShoe.fromJson(Map<String, dynamic> json) {
    print('el json!!!!!!: ' + json.toString());
    //print('el json rating: '+json['rating']);
    return SizeShoe(
      id: json['id'],
      size: json['talla'],
    );
  }
}
