import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatWithAI extends StatefulWidget {
  const ChatWithAI({Key? key}) : super(key: key);

  @override
  State<ChatWithAI> createState() => _ChatWithAIState();
}

class _ChatWithAIState extends State<ChatWithAI> {
  final TextEditingController _searchController = TextEditingController();
  String _response = "";
  bool _isLoading = false;

  Future<String> getResponseFromAPI(String search) async {
    try {
      String apiKey = "YOUR_API_KEY";
      var url = Uri.https("api.openai.com", "/v1/completions");

      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      };

      Map<String, dynamic> body = {
        "model": 'gpt-3.5-turbo',
        "prompt": search,
        "max_tokens": 2000,
      };

      var response =
          await http.post(url, headers: headers, body: jsonEncode(body));
      if (response.statusCode == 200) {
        var responseJson = jsonDecode(response.body);
        return responseJson["choices"][0]["text"];
      } else {
        throw Exception("Failed to get response from API");
      }
    } catch (e) {
      print("Caught exception: $e");
      return "";
    }
  }

  void _getResponse() async {
    setState(() {
      _isLoading = true;
    });

    try {
      String response =
          await getResponseFromAPI(_searchController.text.toString());
      setState(() {
        _response = response;
      });
    } catch (e) {
      _response = e.toString();
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("LinkUP - JestorAI"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(screenHeight / 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  hintText: 'Enter your prompt here',
                ),
              ),
              SizedBox(height: screenHeight / 30),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _getResponse,
                      child: const Text("Generate Response"),
                    ),
              SizedBox(height: screenHeight / 30),
              Card(
                child: _response.isNotEmpty
                    ? Padding(
                        padding: EdgeInsets.only(
                          top: 0,
                          left: screenHeight / 50,
                          right: screenHeight / 50,
                          bottom: screenHeight / 20,
                        ),
                        child: Text(_response),
                      )
                    : Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
