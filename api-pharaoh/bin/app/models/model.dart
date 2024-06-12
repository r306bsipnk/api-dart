import 'package:eloquent/eloquent.dart';

import '../../config/database.dart';

class Model extends QueryBuilder {
  
  Model():super( DB.conn!, DB.conn!.getQueryGrammar(),  DB.conn!.getPostProcessor() );

  
  Future<Map<String, dynamic>> paginate({int perPage=15, List<String> columns = const ['*'], int currentPage = 1})async{
      currentPage = currentPage < 1 ? 1 : currentPage;
      final offset = (currentPage - 1) * perPage;
      final maxRecord = await count();
      final data = await limit(perPage).offset(offset).select(columns).get();
      return {
        'data': data,
        'page': currentPage,
        'pages': (maxRecord/perPage).ceil(),
        'total_record': maxRecord,
        'per_page': perPage,
      };
  }
}