import 'dart:async';
import 'dart:io';

import '../data/storage/local_storage.dart';

class WebSocketHelper {
  late WebSocket _webSocket;
  final String url;

  WebSocketHelper(this.url);

  Future<WebSocket> connect() async {
    _webSocket = await WebSocket.connect(
      url,
      headers: getAuthorizationHeader(),
    );
    handleWebSocketClosure(_webSocket);
    return _webSocket;
  }

  void handleWebSocketClosure(WebSocket webSocket) {
    webSocket.done.then((_) {
      print('WebSocket connection closed with code: ${webSocket.closeCode}');
      if (webSocket.closeCode == 4001) {
        print('Backend sent status code 4001.');
        // Здесь можно обработать ситуацию, когда бэкенд отправляет статус-код 4001
      } else {
        print('Connection closed for another reason.');
        // Здесь можно обработать другие сценарии закрытия соединения, если это необходимо
      }
    });
    // Timer.periodic(const Duration(seconds: 3), (timer) {
    //   if (webSocket.readyState == WebSocket.closed) {
    //     print('closed:');
    //   } else if (webSocket.readyState == WebSocket.open) {
    //     print('open:');
    //   } else if (webSocket.readyState == WebSocket.connecting) {
    //     print('connecting:');
    //   } else if (webSocket.readyState == WebSocket.closing) {
    //     print('closing:');
    //   }
    // });
  }

  bool isConnectionClosed() {
    return _webSocket.readyState == WebSocket.closed;
  }

  Future<bool> isConnected() async {
    return _webSocket.readyState == WebSocket.open;
  }

  void send(String message) {
    _webSocket.add(message);
  }

  Stream<dynamic> stream() {
    return _webSocket.asBroadcastStream();
  }

  void close() {
    _webSocket.close();
  }
}

Map<String, String> getAuthorizationHeader() {
  Map<String, String> headers = {};
  headers[HttpHeaders.contentTypeHeader] = 'application/json';
  headers[HttpHeaders.acceptHeader] = 'application/json';
  headers[HttpHeaders.authorizationHeader] =
      'Bearer ${LocalStorage().token?.access}';
  return headers;
}
