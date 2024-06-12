
import 'package:pharaoh/pharaoh.dart';

class Usercontroller {

    Response list(Request req, Response res){
       return res.ok('2');
    }

    Response store(Request req, Response res){
        return res.ok('1');
    }
}