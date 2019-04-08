import 'package:firebase_database/firebase_database.dart';


class Place {
  String key_place;

  String title_place;

  String discription_place;

  String position_place;

  double note_place;

  String image_place;

  Place(this.title_place, this.discription_place);

  Place.fromSnapshot(DataSnapshot snapshot)
      :
        key_place = snapshot.key,
        title_place = snapshot.value["title_place"],
        discription_place = snapshot.value["discription_place"];

  toJason() {
    return {
      "title_place": title_place,
      "discription_place": discription_place,
    };
  }
}