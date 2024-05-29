import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:perm_test/dream_dialog.dart';
import 'package:perm_test/tracking/location_permission_controller.dart';
import 'package:permission_handler/permission_handler.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  void startLocationTracking() {
    ref.watch(locationPermissionControllerProvider).whenData((_) {
      checkLocAlwaysPerm();
    });
  }

  void checkLocAlwaysPerm() async {
    ref
        .watch(ref
            .read(locationPermissionControllerProvider.notifier)
            .streamLocAlwaysPermission())
        .whenData((PermissionStatus? locAlwaysStatus) async {
      if (locAlwaysStatus != null) {
        if (!locAlwaysStatus.isGranted) {
          /// location always is not availble, make a request
          if (locAlwaysStatus.isPermanentlyDenied) {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) async => await openAppSettingsDialog(),
            );
          } else {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) async => await askLocAlwaysDialog(),
            );
          }
        } else {
          /// location always availble, start location tracking
          // ref
          //     .read(mapOverviewControllerProvider.notifier)
          //     .startLocationTracking(rider: rider);
        }
      }
    });
  }

  Future<dynamic> openAppSettingsDialog() {
    return showDialog(
      context: context,
      builder: (context) => DreamDialog(
          title: 'Location Permission',
          subtitle:
              'In order to use this app we need to use your location. We only track your location while you are online.',
          actionButtons: [
            DreamDialogButton(
              text: 'Open settings',
              onTap: () async {
                Navigator.pop(context);
                await openAppSettings();
              },
              dreamDialogButtonType: DreamDialogButtonType.accept,
            ),
            DreamDialogButton(
              text: 'Cancel',
              onTap: () => Navigator.pop(context),
            ),
          ]),
    );
  }

  Future<dynamic> askLocAlwaysDialog() {
    return showDialog(
      context: context,
      builder: (context) => DreamDialog(
          title: 'Location Permission',
          subtitle:
              'In order to use this app we need to use your location even when the app is in the background. We only track your location while you are online.',
          actionButtons: [
            DreamDialogButton(
              text: 'Allow',
              onTap: () async {
                Navigator.pop(context);
                await Permission.locationAlways
                    .onDeniedCallback(
                      () => WidgetsBinding.instance.addPostFrameCallback(
                        (_) async => await openAppSettingsDialog(),
                      ),
                    )
                    .request();
              },
              dreamDialogButtonType: DreamDialogButtonType.accept,
            ),
            DreamDialogButton(
              text: 'Cancel',
              onTap: () => Navigator.pop(context),
            ),
          ]),
    );
  }

  Widget build(BuildContext context) {
    startLocationTracking();
    return Center(
        child: Container(
      height: 80,
      width: 80,
      color: Colors.amber,
    ));
  }
}
