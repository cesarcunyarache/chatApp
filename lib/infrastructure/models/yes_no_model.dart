import 'package:chat_app/domain/entities/message.dart';


class YesNoModel {
  String aswser;
  bool forced;
  String image;

  YesNoModel({required this.aswser, required this.forced, required this.image});

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) =>
      YesNoModel(aswser: json['answer'], forced: json['forced'], image: json['image']);

  Message toMessageEntity() => Message(
      text: aswser == 'yes' ? 'Si ' : 'No',
      fromWho: FromWho.hers,
      imageUrl: image);
}
