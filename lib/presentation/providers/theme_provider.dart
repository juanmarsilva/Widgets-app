import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Un simple bool.
final isDarkModeProvider = StateProvider<bool>((ref) => false);

// Listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);

// Un simple int.
final selectedColorProvider = StateProvider((ref) => 0);

// Un objeto de tipo AppTheme (custom)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());


class ThemeNotifier extends StateNotifier<AppTheme> {

    // STATE = Estado = new AppTheme();
    ThemeNotifier(): super( AppTheme() );

    void toggleDarkMode() {
        state = state.copyWith( isDarkMode: !state.isDarkMode );
    }

    void changeColorIndex( int selectedColor ) {
        state = state.copyWith( selectedColor: selectedColor );
    }

}