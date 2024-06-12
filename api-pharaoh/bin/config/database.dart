
import 'package:eloquent/eloquent.dart';

class DB{
   static Manager? manager;
   static Connection? conn;
   
   static Future<Connection?> getInstance()async{

      if(DB.manager == null){
          DB.manager = Manager();
          DB.manager?.addConnection({
              'driver': 'mysql',
              'host': '127.0.0.1',
              'port': '3306',
              'database': 'klinik',
              'username': 'lab',
              'password': '12345', 
              'prefix': '',  
              'pool': true,
              'poolsize': 8, 
          });
          DB.manager?.setAsGlobal();
          DB.conn = await DB.manager?.connection();
      }
      return DB.conn;
   }

}