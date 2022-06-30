import 'dart:convert';
import 'dart:io';

class ServerConnection{
  static var ports = {ServerType.ClientHandler : 8000 , ServerType.RegisterHandler : 1717 , ServerType.LoginHandler : 4242 };
  static final  host = "192.168.31.96";
  // static Future<String> send(String data , ServerType type) async {
  //   ServerResult serverResult = ServerResult();
  //   return await serverSend(data, ports[type], serverResult);
  // }
  static Future<String> send(String serverData  , ServerType type) async{
    var result = "";
    int? port = ports[type];
    await Socket.connect(host, port!).then((serverSocket) {
      print("connected");
      serverSocket.write(serverData + "\u0000");
      serverSocket.flush();
      serverSocket.listen((response) {
        result = utf8.decode(response);
      });
    });
    return result;
  }
}
enum ServerType{
  RegisterHandler , ClientHandler ,LoginHandler
}