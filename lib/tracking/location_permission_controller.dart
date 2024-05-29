import 'dart:async';

import 'package:perm_test/tracking/location_permission_repository.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_permission_controller.g.dart';

@riverpod
class LocationPermissionController extends _$LocationPermissionController {
  @override
  FutureOr<void> build() {
    _initializeController();
    _dispose();
  }

  Timer? _timer;

  void _initializeController() {
    _timer = Timer.periodic(const Duration(milliseconds: 1000), (_) async {
      await ref.read(locPermProvider).updateLocationPermissionStatus();
    });
  }

  void _dispose() {
    ref.onDispose(() {
      _timer?.cancel();
    });
  }

  AutoDisposeStreamProvider<PermissionStatus?> streamLocAlwaysPermission() =>
      streamLocAlwaysPerm;

  AutoDisposeStreamProvider<PermissionStatus?>
      streamLocWhileInUsePermission() => streamLocWhileInUsePerm;
}
