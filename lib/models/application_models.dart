import 'package:freezed_annotation/freezed_annotation.dart';
part 'application_models.freezed.dart';
part 'application_models.g.dart';

@freezed
abstract class User with _$User {
  User._();

  factory User({
    required String id,
    String? email,
    String? defaultAddress,
    String? fullName,
  }) = _User;

  bool get hasAddress => defaultAddress?.isNotEmpty ?? false;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
abstract class Address with _$Address {
  factory Address(
      {String? id,
      required String placeId,
      String? street,
      String? city,
      String? state,
      String? postalCode,
      required double lattitude,
      required double longitude}) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
