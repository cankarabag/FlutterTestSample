import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/model/post.dart';
import 'package:test_app/model/user.dart';
import 'package:test_app/model/counter.dart';
import 'package:test_app/service/service_test.dart';

void main() {
  ServiceTest serviceTest;

  setUp(() {
    serviceTest = ServiceTest();
  });

  test("TestCounter", () {
    final counter = Counter(5);
    counter.increase();

    expect(counter.number, 6);
  });

  test("TestUser", () async {
    final response = await serviceTest.getUsers();

    expect(response is List<User>, true);
  });

  test("TestUserPosts", () async {
    final List<Post> response = await serviceTest.getUserPosts(id: 1);

    expect(response.isEmpty, false);
    expect(response is List<Post>, true);
  });

  test("TestPost", () async {
    final Post response = await serviceTest.getPost(id: 5);

    expect(response.title, 'nesciunt quas odio');
  });
}
