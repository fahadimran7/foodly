import 'package:stacked_architecture/api/firestore_api.dart';
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/app/app.logger.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

import '../models/application_models.dart';

class UserService {
  final log = getLogger('UserService');

  final _firestoreApi = locator<FirestoreApi>();
  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  User? _currentUser;

  User get currentUser => _currentUser!;

  get hasLoggedInUser => _firebaseAuthenticationService.hasUser;

  Future<void> syncUserAccount() async {
    final firebaseUserId =
        _firebaseAuthenticationService.firebaseAuth.currentUser!.uid;

    log.v('Sync user: $firebaseUserId');

    final userAccount = await _firestoreApi.getUser(userId: firebaseUserId);

    if (userAccount != null) {
      log.v('User account exists. Save as _currentUser');
      _currentUser = userAccount;
    }
  }

  Future<void> syncOrCreateUserAccount({required User user}) async {
    log.i('user: $user');

    await syncUserAccount();

    if (_currentUser == null) {
      log.v('We have no user account. Creating a new user...');
      await _firestoreApi.createUser(user: user);
      log.v('_currentUser has been saved');
    }
  }

  Future<User?> getUserAccountDetails() async {
    final firebaseUserId =
        _firebaseAuthenticationService.firebaseAuth.currentUser!.uid;

    final userAccount = await _firestoreApi.getUser(userId: firebaseUserId);

    if (userAccount != null) {
      return userAccount;
    }

    return null;
  }

  Future<dynamic> updateUserAccountDetails(
      {String? fullName, required String email}) async {
    try {
      await _firebaseAuthenticationService.updateEmail(email);
      await _firestoreApi.updateUserAccount(
        userId: _currentUser!.id,
        fullName: fullName,
        email: email,
      );

      return true;
    } on FirebaseAuthException catch (e) {
      log.e('Firebase exception raised $e');
      return e.message;
    } catch (e) {
      log.e('Sorry, we were unable to update your profile $e');
      return e;
    }
  }
}
