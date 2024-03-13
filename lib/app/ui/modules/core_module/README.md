# Core Module

Esse Módulo poderia ser extraido para um pacote separado, mas por simplicidade, foi mantido no mesmo
pacote do app.

## Considerações

esse módulo está dependendo de implementações da camada de infraestrutura, porém isso é uma certa
limitação do modular, pois, durante a binding, é necessário passar as implementações concretas para
fazer a inversão de dependencia. Há maneiras de contornar isso, mas por simplicidade, foi mantido

```dart
import 'package:ws_work_test_mobile/app/external/provider/shared_preferences_cache_provider.dart';
import 'package:ws_work_test_mobile/app/external/provider/sqlite_migration_connection.dart';
import 'package:ws_work_test_mobile/app/external/repositories/user_leads/user_leads_repository_impl.dart';
import 'package:ws_work_test_mobile/app/external/services/sqlite_database_migration_service.dart';
import 'package:ws_work_test_mobile/app/external/use_cases/check_internet_connection_impl.dart';
```



