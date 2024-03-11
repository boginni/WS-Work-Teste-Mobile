import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ws_work_test_mobile/app/domain/errors/auth/auth_error.dart';
import 'package:ws_work_test_mobile/app/domain/errors/failure.dart';
import 'package:ws_work_test_mobile/app/ui/extensions/context_extensions.dart';
import 'package:ws_work_test_mobile/app/ui/widgets/providers/global_scaffold_provider.dart';

import '../../../services/failure_message_extraction_service.dart';



class GlobalFailureMessageExtractionService  extends FailureMessageExtractionService {
  AppLocalizations? get _locations => GlobalScaffoldProvider.scaffoldKey.currentContext?.appLocalizations;

  String? extractMessage(Failure failure) {
    if (failure is InternalAuthError) {
      return _locations?.internal_auth_error;
    }

    if (failure is TooManyRequestsError) {
      return _locations?.too_many_requests_error;
    }

    if (failure is InvalidCredentialsError) {
      return _locations?.invalid_credentials_error;
    }

    if (failure is WrongCredentialsError) {
      return _locations?.wrong_credentials_error;
    }

    if (failure is UserNotFoundOrDisabledError) {
      return _locations?.user_not_found_or_disabled_error;
    }

    if (failure is CredentialAlreadyInUseError) {
      return _locations?.credential_already_in_use_error;
    }

    return null;
  }

  String getErrorMessage(Failure failure) {
    final message = extractMessage(failure);
    return message ?? 'Unknown error';
  }
}