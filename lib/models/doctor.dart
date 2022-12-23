import 'package:meta/meta.dart';

class Clinic {
  final String firstName;
  final String lastName;
  final String image;
  final String type;
  final double rating;

  Clinic({
    @required this.firstName,
    @required this.lastName,
    @required this.image,
    @required this.type,
    @required this.rating,
  });
}
