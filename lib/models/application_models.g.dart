// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String,
      email: json['email'] as String?,
      defaultAddress: json['defaultAddress'] as String?,
      fullName: json['fullName'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'defaultAddress': instance.defaultAddress,
      'fullName': instance.fullName,
    };

_$_Address _$$_AddressFromJson(Map<String, dynamic> json) => _$_Address(
      id: json['id'] as String?,
      placeId: json['placeId'] as String,
      street: json['street'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      postalCode: json['postalCode'] as String?,
      lattitude: (json['lattitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$_AddressToJson(_$_Address instance) =>
    <String, dynamic>{
      'id': instance.id,
      'placeId': instance.placeId,
      'street': instance.street,
      'city': instance.city,
      'state': instance.state,
      'postalCode': instance.postalCode,
      'lattitude': instance.lattitude,
      'longitude': instance.longitude,
    };

_$_FeaturedRestaurant _$$_FeaturedRestaurantFromJson(
        Map<String, dynamic> json) =>
    _$_FeaturedRestaurant(
      area: json['area'] as String?,
      city: json['city'] as String,
      deliveryTime: json['deliveryTime'] as String,
      imageUrl: json['imageUrl'] as String,
      name: json['name'] as String,
      offersFreeDelivery: json['offersFreeDelivery'] as bool,
      rating: json['rating'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_FeaturedRestaurantToJson(
        _$_FeaturedRestaurant instance) =>
    <String, dynamic>{
      'area': instance.area,
      'city': instance.city,
      'deliveryTime': instance.deliveryTime,
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'offersFreeDelivery': instance.offersFreeDelivery,
      'rating': instance.rating,
      'tags': instance.tags,
    };

_$_EditorsPickRestaurant _$$_EditorsPickRestaurantFromJson(
        Map<String, dynamic> json) =>
    _$_EditorsPickRestaurant(
      area: json['area'] as String?,
      city: json['city'] as String,
      deliveryTime: json['deliveryTime'] as String,
      imageUrl: json['imageUrl'] as String,
      name: json['name'] as String,
      offersFreeDelivery: json['offersFreeDelivery'] as bool,
      rating: json['rating'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_EditorsPickRestaurantToJson(
        _$_EditorsPickRestaurant instance) =>
    <String, dynamic>{
      'area': instance.area,
      'city': instance.city,
      'deliveryTime': instance.deliveryTime,
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'offersFreeDelivery': instance.offersFreeDelivery,
      'rating': instance.rating,
      'tags': instance.tags,
    };
