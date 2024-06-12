import 'package:api_pharaoh/api_pharaoh.dart' as api_pharaoh;
import 'package:mustache_template/mustache.dart';
import 'package:pharaoh/pharaoh.dart';
import 'package:pharaoh/pharaoh_next.dart';

import 'config/database.dart';
import 'routes.dart';

void main(List<String> arguments) async{
    final app = Pharaoh();
    DB.getInstance();
    
    app.use((req, res, next) {
        logRequests(req, res, ([result, chain]) => null);
        req.auth = {'nama':'tes'};
        next(req);
    });
    routes(app);
    await app.listen();
}
