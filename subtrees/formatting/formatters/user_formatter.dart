class UserFormatter {
  const UserFormatter(this._localizations);

  final AppLocalizations _localizations;

  String formatGender(Gender gender) {
    switch (gender) {
      case Gender.male:
        return _localizations.genderMale;
      case Gender.female:
        return _localizations.genderFemale;
    }
  }
}
