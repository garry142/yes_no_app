import 'package:yes_no_app/domain/entities/message.dart';

class YesNomodels {
  YesNomodels({
    required this.answer,
    required this.forced,
    required this.image,
  });

  final String answer;
  final bool forced;
  final String image;

  factory YesNomodels.fromJsonMap(Map<String, dynamic> json) => YesNomodels(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  Message toMessageEntity() => Message(
    text : answer == 'yes' ?'Si':'No',
    fromWho: FromWho.hers,
    imageUrl: image
  );
}
