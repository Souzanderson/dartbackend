import 'package:shelf/shelf.dart';

abstract class Api {
  Handler getHandler();
  Handler createHandler({
    required Handler router,
    List<Middleware>? middlewares,
  }) {
    middlewares ??= [];
    var pipeline = Pipeline();
    return pipeline.addHandler(router);
  }
}