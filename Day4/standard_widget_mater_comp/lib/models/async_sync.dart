class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(3),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.blueAccent,
          ),
          child: TextButton(
            child: Text(
              "Get Dataa",
              style: TextStyle(foreground: Paint()..color = Colors.white),
            ),
            // onPressed: () {
            onPressed: () async {
              print("1: First line");
              // print("2: sedc line");
              // Future.delayed(Duration(seconds: 1), (() => print("2: sedc line")));
              // await Future.delayed(Duration(seconds: 1), (() => print("2: sedc line")));
              String secL = await Future.delayed(const Duration(seconds: 1), (() {
                return ("2: sedc line");
              }));
              // String sLine = await Future.delayed(Duration(seconds: 1), (() => return "2: sedc line")));
              print(secL);
              print("3: third line");
            },
          ),
        ),
      ),
    );
  }
}

