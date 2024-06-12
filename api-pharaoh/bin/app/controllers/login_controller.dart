
import 'dart:convert';

import 'package:pharaoh/pharaoh.dart';

import '../../config/database.dart';
import '../models/model.dart';
import '../models/poli_model.dart';

class LoginController{

    Future<Response> index(Request req, Response res)async{
      
        final page = int.tryParse('${req.query['page'] ?? 1}') ?? 1;
        final hasil = await (PoliModel().where('nama_poli', 'LIKE', '%gi%') as Model).paginate(
          currentPage: page
        ); 

        return res.json(hasil);
    }

    Future<Response> v(Request req, Response res)async{
        return res.json({'data':req.auth});
                
    }
}