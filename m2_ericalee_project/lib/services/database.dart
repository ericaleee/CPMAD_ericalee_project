import 'package:cloud_firestore/cloud_firestore.dart';
//import 'users.dart';
import 'user.dart';

class DatabaseService{
  final String uid;
  DatabaseService({this.uid});
  //colection reference
  final CollectionReference userdb = Firestore.instance.collection('users');

  Future updateUserData(String email, String name) async {
    return await userdb.document(uid).setData({
      'email' : email,
      'name' : name,
    });
  } 

  // user list from snapshot
  List<User> _userListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return User( 
        name: doc.data['name'] ?? '',
        email: doc.data['email'] ?? '',
      );
    }).toList();
  }

  //userData from snapshot
  UserData _userDataFromSnapShot(DocumentSnapshot snapshot){
    return UserData(
      uid : uid,
      name : snapshot.data['name'],
      email : snapshot.data['email']
    );
  }

  //get user Stream
  Stream<List<User>> get users {
    return userdb.snapshots()
      .map(_userListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return userdb.document(uid).snapshots()
      .map(_userDataFromSnapShot);
  }
}