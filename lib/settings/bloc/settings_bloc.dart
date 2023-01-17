import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pallery/settings/data/enums.dart';
import 'package:pallery/settings/data/setting_data.dart';

class SettingsState extends Equatable {
  const SettingsState({required this.value});

  factory SettingsState.initial() {
    return SettingsState(value: initialValue);
  }

  static final initialValue = AppSettings(
    common: const CommonSettingsSectionData(notification: true),
    display: DisplaySettingsSectionData(
      language: 'en',
    ),
  );

  final AppSettings value;

  @override
  List<Object?> get props => [value];
}

class SettingEvent {
  SettingEvent(this.field, this.value);

  final SettingMenu field;
  final dynamic value;
}

class SettingsBloc extends Bloc<SettingEvent, SettingsState> {
  SettingsBloc(super.initialState) {
    on<SettingEvent>((event, emit) {
      switch (event.field) {
        case SettingMenu.notification:
          final newState = SettingsState(
            value: state.value.copyWith(
              common: CommonSettingsSectionData(
                notification: event.value as bool,
              ),
            ),
          );
          emit(newState);
          break;
        case SettingMenu.fontsize:
          final newState = SettingsState(
            value: state.value.copyWith(
              display: DisplaySettingsSectionData(
                fontsize: event.value as FontSizeSetting,
                darkTheme: state.value.display?.darkTheme,
                language: state.value.display?.language,
              ),
            ),
          );
          emit(newState);
          break;
        case SettingMenu.language:
          final newState = SettingsState(
            value: state.value.copyWith(
              display: DisplaySettingsSectionData(
                fontsize: state.value.display?.fontsize,
                darkTheme: state.value.display?.darkTheme,
                language: event.value.toString(),
              ),
            ),
          );
          emit(newState);
          break;
        case SettingMenu.darkTheme:
          final newState = SettingsState(
            value: state.value.copyWith(
              display: DisplaySettingsSectionData(
                fontsize: state.value.display?.fontsize,
                darkTheme: event.value as DarkThemeSetting,
                language: state.value.display?.language,
              ),
            ),
          );
          emit(newState);
          break;
      }
    });
  }

  factory SettingsBloc.initial() => SettingsBloc(SettingsState.initial());

  void saveSetting(SettingMenu field, dynamic value) {
    add(SettingEvent(field, value));
  }
}
