import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied()
abstract class Env {
  @EnviedField(varName: 'SENTRY_KEY')
  static const sentryDsn = _Env.sentryDsn;
}
