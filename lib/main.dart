import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'package:myapp/core/locator.dart';
import 'package:myapp/features/product/presentation/pages/product_list_page.dart';
import 'package:myapp/localization/locale_provider.dart';
import 'package:myapp/l10n/app_localizations.dart'; // Import generated localizations

void main() {
  setupLocator(); // Call setupLocator before runApp
  runApp(
    ChangeNotifierProvider(
      create: (_) => LocaleProvider(), // Provide the LocaleProvider
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    return MaterialApp(
      title: 'Supermarket POS', // Use a relevant title
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Localization configuration
      locale: provider.locale, // Bind locale to provider state
      supportedLocales: L10n.supportedLocales, // Use supported locales from L10n class
      localizationsDelegates: const [
        AppLocalizations.delegate, // Generated localization delegate
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
         if (provider.locale != null) return provider.locale;

         for (var supported in supportedLocales) {
           if (supported.languageCode == locale?.languageCode) {
             return supported;
           }
         }

         return supportedLocales.first;
       },

      home:  const ProductListPage(), // Set ProductListPage as the home screen
    );
  }
}

// Remove the old MyHomePage and its State class if they are no longer needed
// class MyHomePage extends StatefulWidget { ... }
// class _MyHomePageState extends State<MyHomePage> { ... }
