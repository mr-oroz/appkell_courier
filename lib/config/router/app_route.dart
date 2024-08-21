class AppRoute {
  const AppRoute(this.path, [this._route]);

  final String path;
  final String? _route;

  String call([Map<String, dynamic>? replacements]) {
    var r = _route ?? path;
    if (replacements != null) {
      for (final key in replacements.keys) {
        r = r.replaceAll(':$key', replacements[key].toString());
      }
    }

    return r.startsWith('/') ? r : '/$r';
  }
}
