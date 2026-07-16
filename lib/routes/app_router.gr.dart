// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter_cleanarchitecture_codebase/features/auth/presentation/screens/login_screen.dart'
    as _i1;
import 'package:flutter_cleanarchitecture_codebase/features/posts/presentation/screens/main_post_screen.dart'
    as _i2;
import 'package:flutter_cleanarchitecture_codebase/features/users/presentation/user_screen.dart'
    as _i3;

/// generated route for
/// [_i1.LoginScreen]
class LoginScreen extends _i4.PageRouteInfo<void> {
  const LoginScreen({List<_i4.PageRouteInfo>? children})
    : super(LoginScreen.name, initialChildren: children);

  static const String name = 'LoginScreen';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.LoginScreen();
    },
  );
}

/// generated route for
/// [_i2.MainPostScreen]
class MainPostScreen extends _i4.PageRouteInfo<void> {
  const MainPostScreen({List<_i4.PageRouteInfo>? children})
    : super(MainPostScreen.name, initialChildren: children);

  static const String name = 'MainPostScreen';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.MainPostScreen();
    },
  );
}

/// generated route for
/// [_i3.MainUserScreen]
class MainUserScreen extends _i4.PageRouteInfo<void> {
  const MainUserScreen({List<_i4.PageRouteInfo>? children})
    : super(MainUserScreen.name, initialChildren: children);

  static const String name = 'MainUserScreen';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.MainUserScreen();
    },
  );
}
