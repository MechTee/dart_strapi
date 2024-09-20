import 'package:dart_strapi_client/dart_strapi_client.dart';

final serverUrl = 'http://localhost:1337';
final authToken = '5027d9b5e571423fa87304e4959c24fdfca3c8359636ef7b72c9dd88f052298e6a530cc24959990e37cee708927ac386eb0dbebf92c928ce1165ecc4cf3bb7f44bf59b04dcbc26ef8d9b1ad0368bb71a744ce7514c5d5f195b27032174b4c5465e5e80ee6992c2e6f8975214fde06f6119e2f20ab498de3399e29ed1847b526a';
final collection = 'faqs';
final single = 'about';
final singleId = 'taaafstubryfkuwi7xpzbpqd';

void main() async {
  final client = Strapi(
    serverUrl,
    token: authToken,
  );

  final singleResponse = await client.single.get(single);
  print("Single Response: $singleResponse");
  print("Data: ${singleResponse.item1}");
  print("Meta: ${singleResponse.item2}");
  print("\n----------------------------------------------------\n");

  final collectionResponse = await client.collection.get(collection);
  print("Collection Response: $collectionResponse");
  print("Data: ${collectionResponse.item1}");
  print("Meta: ${collectionResponse.item2}");
  print("\n----------------------------------------------------\n");


  final collectionSingleResponse =
      await client.collection.getOne(collection, singleId);
  print("Collection Single Response: $collectionSingleResponse");
  print("Data: ${collectionSingleResponse.item1}");
  print("Meta: ${collectionSingleResponse.item2}");
  print("\n----------------------------------------------------\n");


  final resourceSingle = await client.resource.get(single);
  print("Resource Single Response: $resourceSingle"); // Response<Data.single>
  print("\n----------------------------------------------------\n");

  final resourceCollection = await client.resource.get(collection);
  print(
      "Resource Collection Response: $resourceCollection"); // Response<Data.collection>
  print("\n----------------------------------------------------\n");

  final resourceCollectionSingle = await client.resource.get("$collection/$singleId");
  print(
      "Resource Collection Single Response: $resourceCollectionSingle"); // Response<Data.single>
  print("\n----------------------------------------------------\n");

  final resourceNoExists = await client.resource.get("lalala");
  print("Resource Not Found Response: $resourceNoExists"); // Response.error
  print("\n----------------------------------------------------\n");
}
