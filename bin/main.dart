import 'package:shelf/shelf.dart';

import 'apis/blog_api.dart';
import 'apis/login_api.dart';
import 'infra/custom_server.dart';
import 'infra/middleware_interception.dart';
import 'infra/security/security_service.dart';
import 'infra/security/security_service_imp.dart';
import 'services/blog_service.dart';
import 'utils/custom_env.dart';

void main() async {
  SecurityService _securityService = SecurityServiceImp();
  var cascadeHandler = Cascade()
      .add(LoginApi(_securityService).handler)
      .add(BlogApi(NewsService()).handler)
      .handler;

  var handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(MidlewareInterception().middleware)
      .addMiddleware(_securityService.authorization)
      .addMiddleware(_securityService.verifyJwt)
      .addHandler(cascadeHandler);

  await CustomServer().initialize(
      handler: handler,
      address: await CustonEnv.get<dynamic>(key: 'server_address'),
      port: 8080);
}
