class DimensionsModel {
  num width;
  num height;
  num depth;

  DimensionsModel({
    required this.width,
    required this.height,
    required this.depth,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'width': width,
      'height': height,
      'depth': depth,
    };
  }

  factory DimensionsModel.fromMap(Map<String, dynamic> map) {
    return DimensionsModel(
      width: map['width'] as num,
      height: map['height'] as num,
      depth: map['depth'] as num,
    );
  }
}
