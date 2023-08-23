import 'package:mongo_dart/mongo_dart.dart';

Future<List<Map<String, dynamic>>> getAllDocuments() async {
  final db = Db('mongodb+srv://test:test@cluster0.gqxcanx.mongodb.net/test?retryWrites=true&w=majority');
  await db.open();

  final collection = db.collection('products');

  final cursor = collection.find(); // Fetch all documents

  final documents = await cursor.toList();

  await db.close();

  return documents;
}

void main() async {
  final allDocuments = await getAllDocuments();
  for (var document in allDocuments) {
    print(document);
  }
}
