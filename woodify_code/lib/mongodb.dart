import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';

import 'const.dart';

Future <bool> verifyLogin(String email, String password) async
{
  //userDoc.clear();
  var db = await Db.create(MONGO_URL);
  await db.open();
  var collection_name = db.collection("users");
  var query = where
      .eq("email", email)
      .eq("password", password);

  final result = await collection_name.findOne(query);
  //final temp = await collection_name.find(query);
  userDoc = result;
  // print("HEre");
  // final categories = userDoc.map((doc) => doc['category'] as String).toList();
  // print(categories);
  await db.close();
  return result != null;

}


Future<List<Map<String, dynamic>>> getAllDocuments()  async {
  var db = await Db.create(MONGO_URL);
  await db.open();

  final collection = db.collection('products');

  final cursor = collection.find(); // Fetch all documents

  final documents = await cursor.toList();



  await db.close();



  return documents;

  //to create var final allDocuments = await getAllDocuments();
}


class MongoDatabase {

  static connect() async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    var collection = db.collection(COLLECTION_NAME);
    var status = db.serverStatus();
    //print(status);

    // await collection.insertOne({
    //   "fistname": "abrar",
    // "second name": "tanim",
    // "email": "abrar.tanim@gmail.com",
    // "password": "1234"});


    //print(await collection.find().toList());
  }

  static userInsert(String firstname, String lastname, String email, String password, String address, int cat) async
  {
    var db = await Db.create(MONGO_URL);
    await db.open();
    var collection_name = db.collection("users");
    await collection_name.insertOne({
      "fistname": firstname,
      "lastname": lastname,
      "email": email,
      "password": password,
      "address" : address,
      "catagory": cat});

    await db.close();
  }

  static productInsert(String p_name, String about, String stock, String price, int cat) async
  {
    //0 for indoor
    //1 for outdoor
    var db = await Db.create(MONGO_URL);
    await db.open();
    var collection_name = db.collection("products");
    await collection_name.insertOne({
      "b_id": userDoc["_id"],
      "p_name": p_name,
      "about": about,
      "stock": stock,
      "price": price,
      "cat": cat});

    await db.close();
  }


  static updateUserData(ObjectId documentId , String fname, String lname, String pass, String add) async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    var collection_name = db.collection("users");

    final query = where.id(documentId); // Specify the query condition

    final update = modify
        .set('fistname', fname)
        .set('lastname', lname)
        .set('password', pass)
        .set('address', add); // Update and add new field

    await collection_name.updateOne(query, update);

    await db.close();
  }


  static UploadUserQues(ObjectId userId, String query,String fname, String lname, DateTime timestamp) async
  {
    //0 for indoor
    //1 for outdoor
    var db = await Db.create(MONGO_URL);
    await db.open();
    var collection_name = db.collection("query");
    await collection_name.insertOne({
      "u_id": userDoc["_id"],
      "name" : fname + " " + lname,
      "ques": query,
      "timestamp": timestamp,
      });

    await db.close();
  }

  static itemorder(ObjectId userId, String itemname, String price, DateTime timestamp, String address) async
  {
    var db = await Db.create(MONGO_URL);
    await db.open();
    var collection_name = db.collection("order_list");
    await collection_name.insertOne({
      "u_id": userDoc["_id"],
      "itemname" : itemname,
      "price": price,
      "address" : address,
      "timestamp": timestamp,
    });

    await db.close();
  }

}

Future <bool> TempverifyLogin(String email, String password) async
{
  //userDoc.clear();
  var db = await Db.create(MONGO_URL);
  await db.open();
  var collection_name = db.collection("users");
  var query = where
      .eq("email", email)
      .eq("password", password);

  final result = await collection_name.findOne(query);
  //final temp = await collection_name.find(query);
  userDoc = result;
  // print("HEre");
  // final categories = userDoc.map((doc) => doc['category'] as String).toList();
  // print(categories);
  await db.close();
  return result != null;

}


