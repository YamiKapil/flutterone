import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get language => 'English';

  @override
  String get appName => 'Note App';

  @override
  String get deleteAll => 'Delete All Data';

  @override
  String get title => 'Title';

  @override
  String get descriptionNote => 'Description';

  @override
  String get submit => 'Submit';

  @override
  String get addNote => 'Add Your Note';

  @override
  String get editNote => 'Edit Your Note';

  @override
  String get deleteAllMessage => 'You are about to delete all the datas. Are You Sure?';

  @override
  String get cancel => 'Cancel';

  @override
  String get deleteOneMessage => 'Are you sure to delete?';

  @override
  String get noData => 'No Data. Start entering notes';
}
