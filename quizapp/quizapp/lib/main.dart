import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizApp(),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State createState() => _QuizAppState();
}

class _QuizAppState extends State {
  List<Map> allQuestion = [
    {
      "question": "Who is the founder of Microsoft?",
      "option": ["Steve Jobs", "Bill Gates", "Larry Page", "Elon Musk"],
      "correctoption": 1
    },
    {
      "question": "Who is the founder of Google?",
      "option": ["Steve Jobs", "Bill Gates", "Larry Page", "Elon Musk"],
      "correctoption": 2
    },
    {
      "question": "Who is the founder of SpaceX?",
      "option": ["Steve Jobs", "Bill Gates", "Larry Page", "Elon Musk"],
      "correctoption": 3
    },
    {
      "question": "Who is the founder of Apple?",
      "option": ["Steve Jobs", "Bill Gates", "Larry Page", "Elon Musk"],
      "correctoption": 0
    },
    {
      "question": "Who is the founder of Meta?",
      "option": ["Steve Jobs", "Mark Zuckerberg", "Larry Page", "Elon Musk"],
      "correctoption": 1
    },
  ];
  int score=0;
  int currentQuestionIndex = 0;
  int selectedAnswerIndex = -1;
  WidgetStateProperty<Color?>checkAnswer(int answerIndex){
    if(selectedAnswerIndex != -1){
      if(answerIndex == allQuestion[currentQuestionIndex]["correctoption"]){
        score++;
        return const WidgetStatePropertyAll(Colors.green);
        
      }else if(selectedAnswerIndex ==answerIndex){
        score--;
        return const WidgetStatePropertyAll(Colors.red);
        
      }else{
        return const WidgetStatePropertyAll(null);
      }
    }else{
      return const WidgetStatePropertyAll(null);
    }
  }
  bool questionpage =true;

  @override

  Widget build(BuildContext context) {
    return isQuestionScreen();
  }
  Scaffold isQuestionScreen(){
    if(questionpage == true){
  
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quiz App",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            color: Colors.orange,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30
            ),
          //question num
          Row(
            children: [
              const SizedBox(
                width: 130
                ),
              Text(
                "Question: ${currentQuestionIndex + 1}/${allQuestion.length}",
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          //Question
          SizedBox(
            width: 380,
            height: 50,
            child: Text(
              allQuestion[currentQuestionIndex]["question"],
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.purple,
              ),
            ),
          ),
          const SizedBox(
            height: 50
            ),
          //option
          SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: checkAnswer(0),
              ),
              onPressed: () {
                if(selectedAnswerIndex==-1){
                  selectedAnswerIndex=0;
                  setState(() {});
                }
              },
              child: Text("A.${allQuestion[currentQuestionIndex]['option'][0]}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color:Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          //option2
          SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: checkAnswer(1),
              ),
              onPressed: () {
                if(selectedAnswerIndex==-1){
                  selectedAnswerIndex=1;
                  setState(() {});
                }
              },
              child: Text("B.${allQuestion[currentQuestionIndex]['option'][1]}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color:Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          //option3
          SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: checkAnswer(2)
              ),
              onPressed: () {
                if(selectedAnswerIndex==-1){
                  selectedAnswerIndex=2;
                  setState(() {});
              }
                  },
              child: Text("C${allQuestion[currentQuestionIndex]['option'][2]}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color:Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          //option4
          SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
              onPressed: () {
                if(selectedAnswerIndex==-1){
                  selectedAnswerIndex=3;
                  setState(() {});
                  }
              },
              style:ButtonStyle(
                backgroundColor:checkAnswer(3),
                ),
              child: Text("D.${allQuestion[currentQuestionIndex]['option'][3]}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color:Colors.black,
                ),
              ),
            ),
          ),
          ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(selectedAnswerIndex !=-1){
            //check the condition and show screen
          if (currentQuestionIndex < allQuestion.length - 1) {
            currentQuestionIndex++;
          }else{
            questionpage = false;
          }
          selectedAnswerIndex =-1;
          
          setState(() {});
          }
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.forward,
          color: Colors.white,
        ),
      ),
    );
  }else{
    return Scaffold(
      appBar:AppBar(
        title:const Text(
          "Quiz Result",
          style:TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            color:Colors.white,
          ),
          ),
          centerTitle:true,
          backgroundColor: Colors.blue,
      ),
    
      
      body:Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children:[
            Image.network(
              "https://tse3.mm.bing.net/th?id=OIP.8QNpPLoZclAoiHKnF3TAbQHaF7&pid=Api&P=0&h=180",
            
            height: 300,
            ),
            const SizedBox(height:30),
            const Text(
              "congratulation",
              style:TextStyle(
                fontSize:30,
                fontWeight:FontWeight.w900,
                color:Colors.orange,
              ),
            ),
            const SizedBox(height:30),
             Text(
              " score:$score/${allQuestion.length}",
              ),
          ],

        ),
        ),
    );
  }
}
}
