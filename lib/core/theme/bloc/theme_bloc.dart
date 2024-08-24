import 'package:e_shop/core/app_preference/app_preferences.dart';
import 'package:e_shop/core/utils/enums/system_mode_enum.dart';
import 'package:e_shop/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeMode> {
  ThemeBloc()
      : super((di.get<AppPreferences>().getIsDarkModeEnabled() ==
                SystemModeEnums.light.toString())
            ? ThemeMode.light
            : ThemeMode.dark) {
    on<ThemeEvent>((event, emit) {
      if (event is ChangeToDarkThemeEvent) {
        di.get<AppPreferences>().setIsDarkModeEnabled(
              event.systemMode.toString(),
            );
        if (event.systemMode == SystemModeEnums.light) {
          emit(ThemeMode.light);
        } else {
          emit(ThemeMode.dark);
        }
      }
    });
  }
}
