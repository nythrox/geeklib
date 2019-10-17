import 'package:geeklib/src/shared/models/collection.dart';
import 'package:geeklib/src/shared/models/user.dart';
import 'package:hasura_connect/hasura_connect.dart';

class UserRepository {
  static String url = "http://geeklib.herokuapp.com/v1/graphql";
  HasuraConnect hasuraConnect = HasuraConnect(url);

  Future<UserModel> login(String email, String password) async {
    try {
      String query = """
      query login (\$email: String!, \$password: String!){
        user(where: {email: {_eq: \$email}, password: {_eq: \$password}}){
          email,
          id,
          password,
          username
        }
      }
    """;
      var result = await hasuraConnect
          .query(query, variables: {"email": email, "password": password});
      return UserModel.fromJson(result["data"]["user"][0]);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<UserModel> register(
      String email, String username, String password) async {
    try {
      String addUser = """
      mutation addUser (\$email:String!, \$password:String!, \$username:String!) {
        insert_user(objects: {email: \$email, password: \$password, username: \$username}) {
          returning {
            email
            id
            password
            username
          }
        }
      }
      """;

      var response = await hasuraConnect.mutation(addUser, variables: {
        "email": email,
        "username": username,
        "password": password
      });
      UserModel userModel = UserModel.fromJson(response["data"]["insert_user"]["returning"][0]);
      addDefaltCollecions(userModel.id);
      return userModel;
    } catch (e) {
      print(e);
      return Future.error(e);
    }
  }

  Future<CollectionModel> addCollection(String name, String userId) async {
    try {
      String addCollection = """
    mutation addCollection (\$name: String!, \$user_id: uuid!) {
      insert_collection(objects: {name: \$name, user_id: \$user_id}) {
        returning {
          id
        }
      }
    }
    """;
      var response = await hasuraConnect.mutation(addCollection,
          variables: {"name": name, "user_id": userId});
      return CollectionModel.fromJson(response["data"]["insert_collection"]["returning"][0]);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> addCollectionBehavior(String behaviorId, String collectionId) async{
    try {
    String addCollectionBehavior = """
    mutation addCollectionBehavior (\$behavior_id: uuid!, \$collection_id: uuid!){
      insert_collecion_has_behavior(objects: {behavior_id: \$behavior_id, collection_id: \$collection_id}) {
        returning {
          collection_id
          behavior_id
        }
      }
    }
    """;
    await hasuraConnect.mutation(addCollectionBehavior, variables: {"behavior_id": behaviorId, "collection_id": collectionId});
    }
    catch (e) {

      rethrow;
    }
  }

  void addDefaltCollecions (String userId) async{
    try {
      CollectionModel history = await addCollection("Book History", userId);
      CollectionModel library =await addCollection("My Books", userId);
      CollectionModel read = await addCollection("Continue Reading", userId);

      addCollectionBehavior("b4e78667-194a-434e-9a70-02ffa67636b4", history.id);
      addCollectionBehavior("ca4986f0-f7dc-4384-9c1c-8c3c6ace6a92", library.id);
      addCollectionBehavior("268b7fda-5a45-4483-961a-2e49d04a5296", read.id);
    }
    catch (e){
      rethrow;
    }

  }

}
