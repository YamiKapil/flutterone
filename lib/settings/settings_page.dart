import 'package:flutter/material.dart';
import 'package:flutter_one/responsive_ui/size_config.dart';
import 'package:provider/provider.dart';

import '../note_app/provider/language_provider.dart';
import '../theme/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLanguage = Provider.of<AppLanguageProvider>(context);
    final themeEditor = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 3.5 * SizeConfig.widthMultiplier!,
          vertical: 2.5 * SizeConfig.heightMultiplier!,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dark Mode',
                  style: TextStyle(fontSize: 2 * SizeConfig.textMultiplier!),
                ),
                Switch.adaptive(
                  value: themeEditor.isDarkMode,
                  onChanged: (value) {
                    themeEditor.setTheme();
                  },
                ),
              ],
            ),
            SizedBox(height: 2 * SizeConfig.heightMultiplier!),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Language',
                  style: TextStyle(fontSize: 2 * SizeConfig.textMultiplier!),
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        // context.read<AppLanguageProvider>().changeLanguage('ne');
                        appLanguage.changeLanguage('ne');
                      },
                      child: const Text(
                        'नेपाली',
                        // style: TextStyle(color: Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        appLanguage.changeLanguage('en');
                        // context.read<AppLanguageProvider>().changeLanguage('en');
                      },
                      child: const Text(
                        'En',
                        // style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
