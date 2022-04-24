import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../models/news_model.dart';
import '../services/generic_service.dart';

class BlogApi {
  final GenericService<NewsModel> _service;
  BlogApi(this._service);

  Handler get handler {
    Router router = Router();

    router.get('/blog/news', (Request req) async {
      List<NewsModel> news = _service.findAll();
      var body = news.map((e) => e.toJson()).toList();
      return Response.ok(jsonEncode(body),
          headers: {'content-type': 'application/json'});
    });

    router.post('/blog/news', (Request req) async {
      var body = await req.readAsString();
      _service.save(NewsModel.fromJson(jsonDecode(body)));
      return Response(201);
    });

    return router;
  }
}
