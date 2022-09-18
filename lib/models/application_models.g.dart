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

_$_Restaurant _$$_RestaurantFromJson(Map<String, dynamic> json) =>
    _$_Restaurant(
      area: json['area'] as String?,
      city: json['city'] as String,
      deliveryTime: json['deliveryTime'] as String,
      imageUrl: json['imageUrl'] as String,
      name: json['name'] as String,
      offersFreeDelivery: json['offersFreeDelivery'] as bool,
      rating: json['rating'] as String,
      restaurantId: json['restaurantId'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_RestaurantToJson(_$_Restaurant instance) =>
    <String, dynamic>{
      'area': instance.area,
      'city': instance.city,
      'deliveryTime': instance.deliveryTime,
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'offersFreeDelivery': instance.offersFreeDelivery,
      'rating': instance.rating,
      'restaurantId': instance.restaurantId,
      'tags': instance.tags,
    };

_$_Menu _$$_MenuFromJson(Map<String, dynamic> json) => _$_Menu(
      name: json['name'] as String,
      price: json['price'] as String,
      category: json['category'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      isFeatured: json['isFeatured'] as bool,
    );

Map<String, dynamic> _$$_MenuToJson(_$_Menu instance) => <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'category': instance.category,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'isFeatured': instance.isFeatured,
    };
