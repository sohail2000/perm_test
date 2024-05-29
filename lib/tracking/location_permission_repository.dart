import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:perm_test/in_memory_store.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationPermissionRepository {
  final _locAlwaysPermState = InMemoryStore<PermissionStatus?>(null);

  Stream<PermissionStatus?> locAlwaysPermChanges() =>
      _locAlwaysPermState.stream;

  // PermissionStatus? get currentLocAlwaysPerm => _locAlwaysPermState.value;

  final _locWhileInUsePermState = InMemoryStore<PermissionStatus?>(null);

  Stream<PermissionStatus?> locWhileInUsePermChanges() =>
      _locWhileInUsePermState.stream;

  // PermissionStatus? get currentLocWhileInUsePerm =>
  //     _locWhileInUsePermState.value;

  Future<void> updateLocationPermissionStatus() async {
    final locWhileInUseStatus = await Permission.locationWhenInUse.status;
    if (locWhileInUseStatus != _locWhileInUsePermState.value) {
      /// only add to stream if there is a change
      _locWhileInUsePermState.value = locWhileInUseStatus;
    }
    final locAlwaysStatus = await Permission.locationAlways.status;
    if (locAlwaysStatus != _locAlwaysPermState.value) {
      /// only add to stream if there is a change
      _locAlwaysPermState.value = locAlwaysStatus;
    }
  }

  void dispose() {
    _locWhileInUsePermState.close();
    _locAlwaysPermState.close();
  }
}

final locPermProvider = Provider((ref) {
  final locPermRepository = LocationPermissionRepository();
  ref.onDispose(() => locPermRepository.dispose());
  return locPermRepository;
});

final streamLocAlwaysPerm =
    StreamProvider.autoDispose<PermissionStatus?>((ref) {
  return ref.read(locPermProvider).locAlwaysPermChanges();
});

final streamLocWhileInUsePerm =
    StreamProvider.autoDispose<PermissionStatus?>((ref) {
  return ref.read(locPermProvider).locWhileInUsePermChanges();
});
