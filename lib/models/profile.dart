import 'package:cloathy/models/address.dart';

class Profile {
  final String name;
  final String phoneNumber;
  final String email;
  final Address address;

  Profile({required this.name,required this.phoneNumber,required this.email,required this.address});
}
