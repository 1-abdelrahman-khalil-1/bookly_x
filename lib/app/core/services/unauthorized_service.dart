import 'package:event_bus/event_bus.dart';
import 'package:rxdart/rxdart.dart';

class UnAuthorizedService {
  static EventBus event = EventBus.customController(BehaviorSubject());

  // static BuildContext get _currContext =>
  //     appRouter.navigatorKey.currentContext!;

  static void init() {
    // listen to the event bus and navigate to the auth page
    event.on<int>().listen((event) {
      // navigate to the auth page
      // if (UserPrefs.isUserLoggedIn) {
      //   UserPrefs.deleteUserToken();
      //   // _currContext.pushAndPopAll(const LoginRoute());
      // appRouter.navigatorKey.currentContext!.pushAndPopAll(const ChooseRoleRoute());
      // }
    });
  }
}
