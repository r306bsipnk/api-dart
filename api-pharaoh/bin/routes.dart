 
import 'package:pharaoh/pharaoh.dart';

import 'app/controllers/login_controller.dart';
import 'app/controllers/user_controller.dart';

void routes(Pharaoh app){
 
   app.get('/', LoginController().index );
   app.get('/t', LoginController().v );

   final user = Pharaoh.router
                ..get('/', Usercontroller().list)
                ..post('/', Usercontroller().store );
   app.group('/user', user );

}