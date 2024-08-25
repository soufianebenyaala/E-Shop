// ignore_for_file: public_member_api_docs, sort_constructors_first

class MetaModel {
  DateTime createdAt;
  DateTime updatedAt;
  String barcode;
  String qrCode;

  MetaModel({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'barcode': barcode,
      'qrCode': qrCode,
    };
  }

  factory MetaModel.fromMap(Map<String, dynamic> map) {
    return MetaModel(
      createdAt: DateTime.parse(map['createdAt'] as String),
      updatedAt: DateTime.parse(map['updatedAt'] as String),
      barcode: map['barcode'] as String,
      qrCode: map['qrCode'] as String,
    );
  }
}
