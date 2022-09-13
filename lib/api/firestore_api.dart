import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stacked_architecture/app/app.logger.dart';
import 'package:stacked_architecture/constants/app_keys.dart';
import 'package:stacked_architecture/exceptions/firestore_api_exception.dart';

import '../models/application_models.dart';

class FirestoreApi {
  final log = getLogger('FirestoreApi');

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection(usersFirestoreKey);

  final CollectionReference regionsCollection =
      FirebaseFirestore.instance.collection(regionsFirestoreKey);

  final CollectionReference featuredRestaurantsCollection =
      FirebaseFirestore.instance.collection(featuredRestaurantsFirestoreKey);

  final CollectionReference editorsPickRestaurantsCollection =
      FirebaseFirestore.instance.collection(editorsPickRestaurantsFirestoreKey);

  Future<void> createUser({required User user}) async {
    log.i('user: $user');

    try {
      final userDocument = usersCollection.doc(user.id);
      await userDocument.set(user.toJson());
      log.v('User created at ${userDocument.path}');
    } catch (error) {
      throw FirestoreApiException(
        message: 'Failed to create new user',
        devDetails: '$error',
      );
    }
  }

  Future<User?> getUser({required String userId}) async {
    log.i('userId: $userId');

    if (userId.isNotEmpty) {
      final userDoc = await usersCollection.doc(userId).get();

      if (!userDoc.exists) {
        log.v('We have no user with id $userId in our database');

        return null;
      }

      final userData = userDoc.data() as Map<String, dynamic>;
      log.v('User found. Data $userData');

      return User.fromJson(userData);
    } else {
      throw FirestoreApiException(
        message:
            'The userId you passed in is empty. Please pass in a valid userId for the Firebase user',
      );
    }
  }

  Future<bool> saveAddress(
      {required Address address, required User user}) async {
    log.i('address:$address');

    try {
      final addressDoc = getAddressCollectionForUser(user.id).doc();
      final newAddressId = addressDoc.id;

      log.v('Address will be stored with id: $newAddressId');

      await addressDoc.set(address.copyWith(id: newAddressId).toJson());

      final hasDefaultAddress = user.hasAddress;

      log.v('Address save complete. hasDefaultAddress:$hasDefaultAddress');

      if (!hasDefaultAddress) {
        log.v(
            'This user has no default address. We need to set the current one as default.');

        await usersCollection.doc(user.id).set(
              user.copyWith(defaultAddress: newAddressId).toJson(),
            );

        log.v('User ${user.id} defaultAddress set to $newAddressId');
      }

      return true;
    } on Exception catch (e) {
      log.e('We could not save user\'s address. $e');
      return false;
    }
  }

  CollectionReference getAddressCollectionForUser(String userId) {
    return usersCollection.doc(userId).collection(addressesFirestoreKey);
  }

  Future<String> getFormattedLocationForUser(String userId) async {
    // We need to get updated user information from firestore
    final userInfo = await usersCollection.doc(userId).get();
    final addressId =
        (userInfo.data() as Map<String, dynamic>)['defaultAddress'];

    final addressDoc = await usersCollection
        .doc(userId)
        .collection(addressesFirestoreKey)
        .doc(addressId)
        .get();

    final addressDetails = addressDoc.data();

    final city = addressDetails?['city'];

    return "$city";
  }

  Future<dynamic> updateUserAccount(
      {String? userId, String? fullName, required String email}) async {
    if (fullName != null) {
      await usersCollection.doc(userId).update(
        {
          'fullName': fullName,
          'email': email,
        },
      );
    }

    await usersCollection.doc(userId).update({'email': email});
  }

  Future<bool> isCityServiced({required String city}) async {
    log.i('city: $city');
    final cityDocument = await regionsCollection.doc(city).get();
    return cityDocument.exists;
  }

  Stream<List<FeaturedRestaurant>> getListOfFeaturedRestaurants() {
    final featuredRestaurantsStream = featuredRestaurantsCollection.snapshots();

    final streamToPublish = featuredRestaurantsStream.map((snapshot) {
      final featuredRestaurantsMap = snapshot.docs;

      final featuredRestaurantsList = featuredRestaurantsMap
          .map((featuredRestaurant) => FeaturedRestaurant.fromJson(
              featuredRestaurant.data() as Map<String, dynamic>))
          .toList();

      return featuredRestaurantsList;
    });

    return streamToPublish;
  }

  Stream<List<EditorsPickRestaurant>> getListOfEditorsPickRestaurants() {
    final editorsPickRestaurantsStream =
        editorsPickRestaurantsCollection.snapshots();

    final streamToPublish = editorsPickRestaurantsStream.map((snapshot) {
      final editorsPickRestaurantsMap = snapshot.docs;

      final editorsPickRestaurantsList = editorsPickRestaurantsMap
          .map((editorsPickRestaurant) => EditorsPickRestaurant.fromJson(
              editorsPickRestaurant.data() as Map<String, dynamic>))
          .toList();

      return editorsPickRestaurantsList;
    });

    return streamToPublish;
  }
}
