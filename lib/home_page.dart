import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:interceptorswork/main.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String _status = '';

  void _doCalls() async {
    _doCall1();
    _doCall2();
    _doCall3();
    _doCall4();
    _doCall5();
  }

  void _doCall1() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    alice.onHttpResponse(response);
    _setStatus(1);
  }

  void _doCall2() async {
    final response = await http.post(
        Uri.parse(
            'https://jsonplaceholder.typicode.com/posts/1/comments?postId=1'),
        body: {'title': 'foo', 'body': 'bar', 'userId': '1'});
    alice.onHttpResponse(response);
    _setStatus(2);
  }

  void _doCall3() async {
    final response = await http.put(Uri.parse(
        'https://jsonplaceholder.typicode.com/posts/1/comments?postId=1'));
    alice.onHttpResponse(response);
    _setStatus(3);
  }

  void _doCall4() async {
    final response = await http.patch(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
        body: {
          'title': 'foo',
        });
    alice.onHttpResponse(response);
    _setStatus(4);
  }

  void _doCall5() async {
    final response = await http.delete(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
        body: {
          'title': 'foo',
        });
    alice.onHttpResponse(response);
    _setStatus(5);
  }

  _setStatus(int call) {
    setState(() {
      _status = '$_status\nCall $call done';
    });
  }

  @override
  void initState() {
    super.initState();
    _doCalls();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: () async {
                _doCalls();
              },
              icon: Icon(Icons.run_circle_outlined)),
          IconButton(
              onPressed: () async {
                alice.showInspector();
              },
              icon: Icon(Icons.show_chart_outlined)),
        ],
      ),
      body: Container(
        child: Text(_status),
      ),
    );
  }
}
