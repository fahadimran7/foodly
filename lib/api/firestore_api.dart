import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stacked_architecture/app/app.logger.dart';
import 'package:stacked_architecture/exceptions/firestore_api_exception.dart';

import '../models/application_models.dart';

class FirestoreApi {
  final log = getLogger('FirestoreApi');

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

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

  Future<bool> saveAddress({required Address address}) async {
    return true;
  }
}
