import 'package:shelf/shelf.dart';

import 'apis/blog_api.dart';
import 'apis/login_api.dart';
import 'infra/custom_server.dart';
import 'services/blog_service.dart';
import 'utils/custom_env.dart';

void main() async {
  var cascadeHandler = Cascade()
      .add(LoginApi().handler)
      .add(BlogApi(NewsService()).handler)
      .handler;
  var handler =
      Pipeline().addMiddleware(logRequests()).addHandler(cascadeHandler);

  CustomServer().initialize(
      handler: handler,
      address: await CustonEnv.get<dynamic>(key: 'server_address'),
      port: await CustonEnv.get<int>(key: 'server_port'));
}
