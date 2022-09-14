// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'application_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get defaultAddress => throw _privateConstructorUsedError;
  String? get fullName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String id, String? email, String? defaultAddress, String? fullName});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? defaultAddress = freezed,
    Object? fullName = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultAddress: defaultAddress == freezed
          ? _value.defaultAddress
          : defaultAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id, String? email, String? defaultAddress, String? fullName});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, (v) => _then(v as _$_User));

  @override
  _$_User get _value => super._value as _$_User;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? defaultAddress = freezed,
    Object? fullName = freezed,
  }) {
    return _then(_$_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultAddress: defaultAddress == freezed
          ? _value.defaultAddress
          : defaultAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User extends _User {
  _$_User({required this.id, this.email, this.defaultAddress, this.fullName})
      : super._();

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final String id;
  @override
  final String? email;
  @override
  final String? defaultAddress;
  @override
  final String? fullName;

  @override
  String toString() {
    return 'User(id: $id, email: $email, defaultAddress: $defaultAddress, fullName: $fullName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality()
                .equals(other.defaultAddress, defaultAddress) &&
            const DeepCollectionEquality().equals(other.fullName, fullName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(defaultAddress),
      const DeepCollectionEquality().hash(fullName));

  @JsonKey(ignore: true)
  @override
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User extends User {
  factory _User(
      {required final String id,
      final String? email,
      final String? defaultAddress,
      final String? fullName}) = _$_User;
  _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get id;
  @override
  String? get email;
  @override
  String? get defaultAddress;
  @override
  String? get fullName;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
mixin _$Address {
  String? get id => throw _privateConstructorUsedError;
  String get placeId => throw _privateConstructorUsedError;
  String? get street => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get postalCode => throw _privateConstructorUsedError;
  double get lattitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String placeId,
      String? street,
      String? city,
      String? state,
      String? postalCode,
      double lattitude,
      double longitude});
}

/// @nodoc
class _$AddressCopyWithImpl<$Res> implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  final Address _value;
  // ignore: unused_field
  final $Res Function(Address) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? placeId = freezed,
    Object? street = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? postalCode = freezed,
    Object? lattitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      placeId: placeId == freezed
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      street: street == freezed
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: postalCode == freezed
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      lattitude: lattitude == freezed
          ? _value.lattitude
          : lattitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_AddressCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$$_AddressCopyWith(
          _$_Address value, $Res Function(_$_Address) then) =
      __$$_AddressCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String placeId,
      String? street,
      String? city,
      String? state,
      String? postalCode,
      double lattitude,
      double longitude});
}

/// @nodoc
class __$$_AddressCopyWithImpl<$Res> extends _$AddressCopyWithImpl<$Res>
    implements _$$_AddressCopyWith<$Res> {
  __$$_AddressCopyWithImpl(_$_Address _value, $Res Function(_$_Address) _then)
      : super(_value, (v) => _then(v as _$_Address));

  @override
  _$_Address get _value => super._value as _$_Address;

  @override
  $Res call({
    Object? id = freezed,
    Object? placeId = freezed,
    Object? street = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? postalCode = freezed,
    Object? lattitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_$_Address(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      placeId: placeId == freezed
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      street: street == freezed
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: postalCode == freezed
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      lattitude: lattitude == freezed
          ? _value.lattitude
          : lattitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Address implements _Address {
  _$_Address(
      {this.id,
      required this.placeId,
      this.street,
      this.city,
      this.state,
      this.postalCode,
      required this.lattitude,
      required this.longitude});

  factory _$_Address.fromJson(Map<String, dynamic> json) =>
      _$$_AddressFromJson(json);

  @override
  final String? id;
  @override
  final String placeId;
  @override
  final String? street;
  @override
  final String? city;
  @override
  final String? state;
  @override
  final String? postalCode;
  @override
  final double lattitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'Address(id: $id, placeId: $placeId, street: $street, city: $city, state: $state, postalCode: $postalCode, lattitude: $lattitude, longitude: $longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Address &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.placeId, placeId) &&
            const DeepCollectionEquality().equals(other.street, street) &&
            const DeepCollectionEquality().equals(other.city, city) &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality()
                .equals(other.postalCode, postalCode) &&
            const DeepCollectionEquality().equals(other.lattitude, lattitude) &&
            const DeepCollectionEquality().equals(other.longitude, longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(placeId),
      const DeepCollectionEquality().hash(street),
      const DeepCollectionEquality().hash(city),
      const DeepCollectionEquality().hash(state),
      const DeepCollectionEquality().hash(postalCode),
      const DeepCollectionEquality().hash(lattitude),
      const DeepCollectionEquality().hash(longitude));

  @JsonKey(ignore: true)
  @override
  _$$_AddressCopyWith<_$_Address> get copyWith =>
      __$$_AddressCopyWithImpl<_$_Address>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddressToJson(
      this,
    );
  }
}

abstract class _Address implements Address {
  factory _Address(
      {final String? id,
      required final String placeId,
      final String? street,
      final String? city,
      final String? state,
      final String? postalCode,
      required final double lattitude,
      required final double longitude}) = _$_Address;

  factory _Address.fromJson(Map<String, dynamic> json) = _$_Address.fromJson;

  @override
  String? get id;
  @override
  String get placeId;
  @override
  String? get street;
  @override
  String? get city;
  @override
  String? get state;
  @override
  String? get postalCode;
  @override
  double get lattitude;
  @override
  double get longitude;
  @override
  @JsonKey(ignore: true)
  _$$_AddressCopyWith<_$_Address> get copyWith =>
      throw _privateConstructorUsedError;
}

FeaturedRestaurant _$FeaturedRestaurantFromJson(Map<String, dynamic> json) {
  return _FeaturedRestaurant.fromJson(json);
}

/// @nodoc
mixin _$FeaturedRestaurant {
  String? get area => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get deliveryTime => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get offersFreeDelivery => throw _privateConstructorUsedError;
  String get rating => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeaturedRestaurantCopyWith<FeaturedRestaurant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeaturedRestaurantCopyWith<$Res> {
  factory $FeaturedRestaurantCopyWith(
          FeaturedRestaurant value, $Res Function(FeaturedRestaurant) then) =
      _$FeaturedRestaurantCopyWithImpl<$Res>;
  $Res call(
      {String? area,
      String city,
      String deliveryTime,
      String imageUrl,
      String name,
      bool offersFreeDelivery,
      String rating,
      List<String> tags});
}

/// @nodoc
class _$FeaturedRestaurantCopyWithImpl<$Res>
    implements $FeaturedRestaurantCopyWith<$Res> {
  _$FeaturedRestaurantCopyWithImpl(this._value, this._then);

  final FeaturedRestaurant _value;
  // ignore: unused_field
  final $Res Function(FeaturedRestaurant) _then;

  @override
  $Res call({
    Object? area = freezed,
    Object? city = freezed,
    Object? deliveryTime = freezed,
    Object? imageUrl = freezed,
    Object? name = freezed,
    Object? offersFreeDelivery = freezed,
    Object? rating = freezed,
    Object? tags = freezed,
  }) {
    return _then(_value.copyWith(
      area: area == freezed
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryTime: deliveryTime == freezed
          ? _value.deliveryTime
          : deliveryTime // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      offersFreeDelivery: offersFreeDelivery == freezed
          ? _value.offersFreeDelivery
          : offersFreeDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$$_FeaturedRestaurantCopyWith<$Res>
    implements $FeaturedRestaurantCopyWith<$Res> {
  factory _$$_FeaturedRestaurantCopyWith(_$_FeaturedRestaurant value,
          $Res Function(_$_FeaturedRestaurant) then) =
      __$$_FeaturedRestaurantCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? area,
      String city,
      String deliveryTime,
      String imageUrl,
      String name,
      bool offersFreeDelivery,
      String rating,
      List<String> tags});
}

/// @nodoc
class __$$_FeaturedRestaurantCopyWithImpl<$Res>
    extends _$FeaturedRestaurantCopyWithImpl<$Res>
    implements _$$_FeaturedRestaurantCopyWith<$Res> {
  __$$_FeaturedRestaurantCopyWithImpl(
      _$_FeaturedRestaurant _value, $Res Function(_$_FeaturedRestaurant) _then)
      : super(_value, (v) => _then(v as _$_FeaturedRestaurant));

  @override
  _$_FeaturedRestaurant get _value => super._value as _$_FeaturedRestaurant;

  @override
  $Res call({
    Object? area = freezed,
    Object? city = freezed,
    Object? deliveryTime = freezed,
    Object? imageUrl = freezed,
    Object? name = freezed,
    Object? offersFreeDelivery = freezed,
    Object? rating = freezed,
    Object? tags = freezed,
  }) {
    return _then(_$_FeaturedRestaurant(
      area: area == freezed
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryTime: deliveryTime == freezed
          ? _value.deliveryTime
          : deliveryTime // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      offersFreeDelivery: offersFreeDelivery == freezed
          ? _value.offersFreeDelivery
          : offersFreeDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
      tags: tags == freezed
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FeaturedRestaurant implements _FeaturedRestaurant {
  _$_FeaturedRestaurant(
      {this.area,
      required this.city,
      required this.deliveryTime,
      required this.imageUrl,
      required this.name,
      required this.offersFreeDelivery,
      required this.rating,
      required final List<String> tags})
      : _tags = tags;

  factory _$_FeaturedRestaurant.fromJson(Map<String, dynamic> json) =>
      _$$_FeaturedRestaurantFromJson(json);

  @override
  final String? area;
  @override
  final String city;
  @override
  final String deliveryTime;
  @override
  final String imageUrl;
  @override
  final String name;
  @override
  final bool offersFreeDelivery;
  @override
  final String rating;
  final List<String> _tags;
  @override
  List<String> get tags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'FeaturedRestaurant(area: $area, city: $city, deliveryTime: $deliveryTime, imageUrl: $imageUrl, name: $name, offersFreeDelivery: $offersFreeDelivery, rating: $rating, tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FeaturedRestaurant &&
            const DeepCollectionEquality().equals(other.area, area) &&
            const DeepCollectionEquality().equals(other.city, city) &&
            const DeepCollectionEquality()
                .equals(other.deliveryTime, deliveryTime) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.offersFreeDelivery, offersFreeDelivery) &&
            const DeepCollectionEquality().equals(other.rating, rating) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(area),
      const DeepCollectionEquality().hash(city),
      const DeepCollectionEquality().hash(deliveryTime),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(offersFreeDelivery),
      const DeepCollectionEquality().hash(rating),
      const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  _$$_FeaturedRestaurantCopyWith<_$_FeaturedRestaurant> get copyWith =>
      __$$_FeaturedRestaurantCopyWithImpl<_$_FeaturedRestaurant>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FeaturedRestaurantToJson(
      this,
    );
  }
}

abstract class _FeaturedRestaurant implements FeaturedRestaurant {
  factory _FeaturedRestaurant(
      {final String? area,
      required final String city,
      required final String deliveryTime,
      required final String imageUrl,
      required final String name,
      required final bool offersFreeDelivery,
      required final String rating,
      required final List<String> tags}) = _$_FeaturedRestaurant;

  factory _FeaturedRestaurant.fromJson(Map<String, dynamic> json) =
      _$_FeaturedRestaurant.fromJson;

  @override
  String? get area;
  @override
  String get city;
  @override
  String get deliveryTime;
  @override
  String get imageUrl;
  @override
  String get name;
  @override
  bool get offersFreeDelivery;
  @override
  String get rating;
  @override
  List<String> get tags;
  @override
  @JsonKey(ignore: true)
  _$$_FeaturedRestaurantCopyWith<_$_FeaturedRestaurant> get copyWith =>
      throw _privateConstructorUsedError;
}

EditorsPickRestaurant _$EditorsPickRestaurantFromJson(
    Map<String, dynamic> json) {
  return _EditorsPickRestaurant.fromJson(json);
}

/// @nodoc
mixin _$EditorsPickRestaurant {
  String? get area => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get deliveryTime => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get offersFreeDelivery => throw _privateConstructorUsedError;
  String get rating => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EditorsPickRestaurantCopyWith<EditorsPickRestaurant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditorsPickRestaurantCopyWith<$Res> {
  factory $EditorsPickRestaurantCopyWith(EditorsPickRestaurant value,
          $Res Function(EditorsPickRestaurant) then) =
      _$EditorsPickRestaurantCopyWithImpl<$Res>;
  $Res call(
      {String? area,
      String city,
      String deliveryTime,
      String imageUrl,
      String name,
      bool offersFreeDelivery,
      String rating,
      List<String> tags});
}

/// @nodoc
class _$EditorsPickRestaurantCopyWithImpl<$Res>
    implements $EditorsPickRestaurantCopyWith<$Res> {
  _$EditorsPickRestaurantCopyWithImpl(this._value, this._then);

  final EditorsPickRestaurant _value;
  // ignore: unused_field
  final $Res Function(EditorsPickRestaurant) _then;

  @override
  $Res call({
    Object? area = freezed,
    Object? city = freezed,
    Object? deliveryTime = freezed,
    Object? imageUrl = freezed,
    Object? name = freezed,
    Object? offersFreeDelivery = freezed,
    Object? rating = freezed,
    Object? tags = freezed,
  }) {
    return _then(_value.copyWith(
      area: area == freezed
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryTime: deliveryTime == freezed
          ? _value.deliveryTime
          : deliveryTime // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      offersFreeDelivery: offersFreeDelivery == freezed
          ? _value.offersFreeDelivery
          : offersFreeDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$$_EditorsPickRestaurantCopyWith<$Res>
    implements $EditorsPickRestaurantCopyWith<$Res> {
  factory _$$_EditorsPickRestaurantCopyWith(_$_EditorsPickRestaurant value,
          $Res Function(_$_EditorsPickRestaurant) then) =
      __$$_EditorsPickRestaurantCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? area,
      String city,
      String deliveryTime,
      String imageUrl,
      String name,
      bool offersFreeDelivery,
      String rating,
      List<String> tags});
}

/// @nodoc
class __$$_EditorsPickRestaurantCopyWithImpl<$Res>
    extends _$EditorsPickRestaurantCopyWithImpl<$Res>
    implements _$$_EditorsPickRestaurantCopyWith<$Res> {
  __$$_EditorsPickRestaurantCopyWithImpl(_$_EditorsPickRestaurant _value,
      $Res Function(_$_EditorsPickRestaurant) _then)
      : super(_value, (v) => _then(v as _$_EditorsPickRestaurant));

  @override
  _$_EditorsPickRestaurant get _value =>
      super._value as _$_EditorsPickRestaurant;

  @override
  $Res call({
    Object? area = freezed,
    Object? city = freezed,
    Object? deliveryTime = freezed,
    Object? imageUrl = freezed,
    Object? name = freezed,
    Object? offersFreeDelivery = freezed,
    Object? rating = freezed,
    Object? tags = freezed,
  }) {
    return _then(_$_EditorsPickRestaurant(
      area: area == freezed
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryTime: deliveryTime == freezed
          ? _value.deliveryTime
          : deliveryTime // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      offersFreeDelivery: offersFreeDelivery == freezed
          ? _value.offersFreeDelivery
          : offersFreeDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
      tags: tags == freezed
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EditorsPickRestaurant implements _EditorsPickRestaurant {
  _$_EditorsPickRestaurant(
      {this.area,
      required this.city,
      required this.deliveryTime,
      required this.imageUrl,
      required this.name,
      required this.offersFreeDelivery,
      required this.rating,
      required final List<String> tags})
      : _tags = tags;

  factory _$_EditorsPickRestaurant.fromJson(Map<String, dynamic> json) =>
      _$$_EditorsPickRestaurantFromJson(json);

  @override
  final String? area;
  @override
  final String city;
  @override
  final String deliveryTime;
  @override
  final String imageUrl;
  @override
  final String name;
  @override
  final bool offersFreeDelivery;
  @override
  final String rating;
  final List<String> _tags;
  @override
  List<String> get tags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'EditorsPickRestaurant(area: $area, city: $city, deliveryTime: $deliveryTime, imageUrl: $imageUrl, name: $name, offersFreeDelivery: $offersFreeDelivery, rating: $rating, tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditorsPickRestaurant &&
            const DeepCollectionEquality().equals(other.area, area) &&
            const DeepCollectionEquality().equals(other.city, city) &&
            const DeepCollectionEquality()
                .equals(other.deliveryTime, deliveryTime) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.offersFreeDelivery, offersFreeDelivery) &&
            const DeepCollectionEquality().equals(other.rating, rating) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(area),
      const DeepCollectionEquality().hash(city),
      const DeepCollectionEquality().hash(deliveryTime),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(offersFreeDelivery),
      const DeepCollectionEquality().hash(rating),
      const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  _$$_EditorsPickRestaurantCopyWith<_$_EditorsPickRestaurant> get copyWith =>
      __$$_EditorsPickRestaurantCopyWithImpl<_$_EditorsPickRestaurant>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EditorsPickRestaurantToJson(
      this,
    );
  }
}

abstract class _EditorsPickRestaurant implements EditorsPickRestaurant {
  factory _EditorsPickRestaurant(
      {final String? area,
      required final String city,
      required final String deliveryTime,
      required final String imageUrl,
      required final String name,
      required final bool offersFreeDelivery,
      required final String rating,
      required final List<String> tags}) = _$_EditorsPickRestaurant;

  factory _EditorsPickRestaurant.fromJson(Map<String, dynamic> json) =
      _$_EditorsPickRestaurant.fromJson;

  @override
  String? get area;
  @override
  String get city;
  @override
  String get deliveryTime;
  @override
  String get imageUrl;
  @override
  String get name;
  @override
  bool get offersFreeDelivery;
  @override
  String get rating;
  @override
  List<String> get tags;
  @override
  @JsonKey(ignore: true)
  _$$_EditorsPickRestaurantCopyWith<_$_EditorsPickRestaurant> get copyWith =>
      throw _privateConstructorUsedError;
}
