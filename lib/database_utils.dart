library database_utils;

import 'package:firebase_database/firebase_database.dart';

/// A utility class for interacting with Firebase Database.
class DatabaseUtils {
  // region ----------Basic----------

  /// Returns a DatabaseReference pointing to the specified path in the Firebase Database.
  ///
  /// The path is split into segments, and a child is created for each segment.
  /// If the path is null, a DatabaseReference pointing to the root of the database is returned.
  ///
  /// [path] is a string representing the path in the Firebase Database.
  static DatabaseReference ref(String? path) {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    if (path == null) return ref;
    var allChild = path.split("/").toList();
    for (var c in allChild) {
      ref = ref.child(c);
    }
    return ref;
  }

  /// Returns a Future that completes with a DataSnapshot containing the data at the specified location in the database.
  ///
  /// This method retrieves the data at the given path in the Firebase Database.
  /// If the path is null, the data at the root of the database is retrieved.
  ///
  /// [path] is a string representing the path in the Firebase Database.
  static Future<DataSnapshot> get(String? path) async => await ref(path).get();

  // endregion

  // region ----------Actions----------

  /// Sets the data at the specified location in the database.
  ///
  /// This method sets the data at the given path in the Firebase Database.
  /// If the path is null, the data at the root of the database is set.
  ///
  /// [path] is a string representing the path in the Firebase Database.
  /// [value] is a map(String, dynamic) containing the data to set.
  static Future<void> set(String? path, Map<String, dynamic> value) async =>
      await ref(path).set(value);

  /// Updates the data at the specified location in the database.
  ///
  /// This method updates the data at the given path in the Firebase Database.
  /// If the path is null, the data at the root of the database is updated.
  ///
  /// [path] is a string representing the path in the Firebase Database.
  /// [value] is a map(String, dynamic) containing the data to update.
  static Future<void> update(String? path, Map<String, dynamic> value) async =>
      await ref(path).update(value);

  /// Removes the data at the specified location in the database.
  ///
  /// This method removes the data at the given path in the Firebase Database.
  /// If the path is null, the data at the root of the database is removed.
  ///
  /// [path] is a string representing the path in the Firebase Database.
  static Future<void> remove(String? path) async => await ref(path).remove();

  // endregion

  //region ----------Streams----------

  /// Returns a Stream of DatabaseEvent containing the data at the specified location in the database.
  ///
  /// This method listens for changes at the given path in the Firebase Database.
  /// If the path is null, the data at the root of the database is listened to.
  ///
  /// [path] is a string representing the path in the Firebase Database.
  static Stream<DatabaseEvent> onValue(String? path) => ref(path).onValue;

  /// Returns a Stream of DatabaseEvent containing the data at the specified location in the database.
  ///
  /// This method listens for changes at the given path in the Firebase Database.
  /// If the path is null, the data at the root of the database is listened to.
  ///
  /// [path] is a string representing the path in the Firebase Database.
  static Stream<DatabaseEvent> onChildAdded(String? path) =>
      ref(path).onChildAdded;

  /// Returns a Stream of DatabaseEvent containing the data at the specified location in the database.
  ///
  /// This method listens for changes at the given path in the Firebase Database.
  /// If the path is null, the data at the root of the database is listened to.
  ///
  /// [path] is a string representing the path in the Firebase Database.
  static Stream<DatabaseEvent> onChildChanged(String? path) =>
      ref(path).onChildChanged;

  /// Returns a Stream of DatabaseEvent containing the data at the specified location in the database.
  ///
  /// This method listens for changes at the given path in the Firebase Database.
  /// If the path is null, the data at the root of the database is listened to.
  ///
  /// [path] is a string representing the path in the Firebase Database.
  static Stream<DatabaseEvent> onChildRemoved(String? path) =>
      ref(path).onChildRemoved;

  /// Returns a Stream of DatabaseEvent containing the data at the specified location in the database.
  ///
  /// This method listens for changes at the given path in the Firebase Database.
  /// If the path is null, the data at the root of the database is listened to.
  ///
  /// [path] is a string representing the path in the Firebase Database.
  static Stream<DatabaseEvent> onChildMoved(String? path) =>
      ref(path).onChildMoved;

  //endregion
}