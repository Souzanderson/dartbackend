import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

class CustomServer {
  Future<void> initialize(
      {required Handler handler,
      required dynamic address,
      required int port}) async {
    await shelf_io.serve(handler, 'localhost', port);
    print('🚀 Server Init => http://$address:$port 🚀');
  }
}
