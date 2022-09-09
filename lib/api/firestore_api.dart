import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stacked_architecture/app/app.logger.dart';
import 'package:stacked_architecture/constants/app_keys.dart';
import 'package:stacked_architecture/exceptions/firestore_api_exception.dart';

import '../models/application_models.dart';

class FirestoreApi {
  final log = getLogger('FirestoreApi');

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection(usersFirestoreKey);

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

  Future<String> getFormattedLocationForUser(User user) async {
    final addressDoc = await usersCollection
        .doc(user.id)
        .collection(addressesFirestoreKey)
        .doc(user.defaultAddress)
        .get();

    final addressDetails = addressDoc.data();

    final street = addressDetails!['street'] ?? '';
    final city = addressDetails['city'];

    return "$street $city";
  }
}
