import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';

class LabelOverrides extends PtLocalizations {
  const LabelOverrides();

  @override
  String get emailInputLabel => 'Digite seu Email';

  @override
  String get passwordInputLabel => 'Digite sua Senha';

  @override
  String get emailIsNotVerifiedText => 'Email não verificado';

  @override
  String get confirmDeleteAccountButtonLabel => 'Confirmar exclusão da conta';

  @override
  String get sendVerificationEmailLabel => 'Enviar email de verificação';

  @override
  String get dismissButtonLabel => 'Ignorar';
}
