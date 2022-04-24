class ApiRouterValidate {
  final List<String> _routes = [];

  ApiRouterValidate add(String route) {
    _routes.add(route);
    return this;
  }

  bool isPublic(route) {
    return _routes.contains(route);
  }
}
