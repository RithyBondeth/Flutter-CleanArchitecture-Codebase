// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter_cleanarchitecture_codebase/features/posts/presentation/screens/main_post_screen.dart'
    as _i1;
import 'package:flutter_cleanarchitecture_codebase/features/users/presentation/user_screen.dart'
    as _i2;

/// generated route for
/// [_i1.MainPostScreen]
class MainPostScreen extends _i3.PageRouteInfo<void> {
  const MainPostScreen({List<_i3.PageRouteInfo>? children})
    : super(MainPostScreen.name, initialChildren: children);

  static const String name = 'MainPostScreen';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.MainPostScreen();
    },
  );
}

/// generated route for
/// [_i2.MainUserScreen]
class MainUserScreen extends _i3.PageRouteInfo<void> {
  const MainUserScreen({List<_i3.PageRouteInfo>? children})
    : super(MainUserScreen.name, initialChildren: children);

  static const String name = 'MainUserScreen';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.MainUserScreen();
    },
  );
}
