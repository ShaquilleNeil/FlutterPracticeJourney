import 'package:crashcourse/pages/loading.dart';
import 'package:crashcourse/quote.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:crashcourse/quote_card.dart';
import 'pages/home.dart';
import 'pages/choose_location.dart';
import 'package:crashcourse/todo.dart';
import 'package:crashcourse/todolist.dart';
import 'package:crashcourse/pages/signup.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FirebaseCRUD(),
  ));
}

String name = 'Flutter';
int number = 0;
double decimalNumber = 0.0;
List list = [];
Map<String, dynamic> map = {'name': 'Flutter', 'age': 0};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 50, 135, 255),
          brightness: Brightness.light,
        ),
      ),


      home: Scaffold(

        appBar: AppBar(
          title: Text('Flutter Practice'),
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),


        body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
            Text(
            'Hello Moto',
          style: TextStyle(
            color: Colors.deepPurpleAccent,
            fontSize: 44,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
          ),

          SizedBox(height: 20),

          Image(
            image: AssetImage('assets/images/bg.jpg'),
            width: 200,
            height: 200,
            fit: BoxFit.cover,
            
          ),
          SizedBox(height: 20),

          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/bg.jpg'),
          ),
          Icon (
            Icons.email,
            size: 50,
            color: Colors.deepPurpleAccent,
  
          ),

          Divider(
            color: Colors.deepPurpleAccent,
            thickness: 2,
            indent: 50,
            endIndent: 50,
          ),

          ElevatedButton (
            onPressed: () {
              print('Elevated Button Pressed');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurpleAccent,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),


                    child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.touch_app, color: Colors.white),
            SizedBox(width: 8),
            Text(
              'Click',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

            
          ),


          ],

          ),

         
          ),


          floatingActionButton: FloatingActionButton(
           
            backgroundColor: Colors.deepPurpleAccent,
            onPressed: () {
              print('Floating Action Button Pressed');
            },

             child: Text(
              'click',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),

          
          ),

      ),


    );
  }
}

//stateful widget - used when we want to change the state of the widget
class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  int counter = 0;
  List<String> quotes1 = [
    'The only way to do great work is to love what you do. - Steve Jobs',
    'Success is not the key to happiness. Happiness is the key to success. - Albert Schweitzer',
    'Believe you can and you\'re halfway there. - Theodore Roosevelt',
    'Your time is limited, don\'t waste it living someone else\'s life. - Steve Jobs',
    'The best way to predict the future is to invent it. - Alan Kay',
  ];

List<Quote> quotes2 = [ 
    Quote('The only way to do great work is to love what you do.', 'Steve Jobs'),
    Quote('Success is not the key to happiness. Happiness is the key to success.', 'Albert Schweitzer'),
    Quote('Believe you can and you\'re halfway there.', 'Theodore Roosevelt'),
    Quote('Your time is limited, don\'t waste it living someone else\'s life.', 'Steve Jobs'),
    Quote('The best way to predict the future is to invent it.', 'Alan Kay'),
  ];
  


//quote card 
 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(          
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stateful Widget',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          )),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                // ...quotes1.map((quote) => Text(quote)).toList(),
                // ...quotes2.map((quote) => quoteCard(quote)).toList(),
                QuoteCard(
                  quote: quotes2[counter % quotes2.length],
                  delete: () {
                    setState(() {
                      quotes2.removeAt(counter % quotes2.length);
                    });
                  },),

                // Text(quotes2[counter % quotes2.length].text, style: TextStyle(fontSize: 18, color: Colors.deepPurpleAccent), textAlign: TextAlign.center,),
                // Text('- ${quotes2[counter % quotes2.length].author}', style: TextStyle(fontSize: 16, color: Colors.deepPurpleAccent, fontStyle: FontStyle.italic), textAlign: TextAlign.center,),

              // Text(
              //   quotes1[counter % quotes1.length], // Display a quote based on the counter value
              //   style: TextStyle(fontSize: 18, color: Colors.deepPurpleAccent),
              //   textAlign: TextAlign.center,
              // ),

              SizedBox(height: 20),

              Text(
                'Counter: $counter',
                style: TextStyle(fontSize: 24, color: Colors.deepPurpleAccent),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    counter++;
                  
                  });
                },
                child: Text('Increment Counter'),
              ),

              ElevatedButton(onPressed: () => setState(() => counter = 0), child: Text('Reset Counter'))
            ],
          ),
        ),
      ),
    );
  }
}

class TestTimeWidget extends StatefulWidget {
  const TestTimeWidget({super.key});

  @override
  State<TestTimeWidget> createState() => _TestTimeWidgetState();
}

// bringing the home screen to the main.dart file
class _TestTimeWidgetState extends State<TestTimeWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
       routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  
  },

    );
  }
}


class TodoWidget extends StatefulWidget {
  const TodoWidget({super.key});

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {

final List<Todo> todos = [
    Todo(
      title: 'Buy groceries',
      description: 'Milk, bread, eggs',
      priority: Priority.high,
      isCompleted: false,
    ),
    Todo(
      title: 'Walk the dog',
      description: 'Take Fido for a walk in the park',
      priority: Priority.medium,
      isCompleted: true,
    ),
    Todo(
      title: 'Read a book',
      description: 'Read "The Great Gatsby" by F. Scott Fitzgerald',
      priority: Priority.low,
      isCompleted: false,
    ),
  ];

  String _email = '';
  String _description = '';
  Priority _selectedPriority = Priority.low;
  final bool _isCompleted = false;

  final TextEditingController _emailController = TextEditingController();
  final _formGlobalKey = GlobalKey<FormState>();

  void _toggleTodo(int index) {
    setState(() {
      todos[index].isCompleted = !todos[index].isCompleted;
    });
  }




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Todo App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          )),
          backgroundColor: const Color.fromARGB(255, 89, 0, 255),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(  
          children: [
            Expanded(child: TodoList(todos: todos, toggle: _toggleTodo)),

            Form(
              key: _formGlobalKey, //used to keep track of the form state
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //todo title
                TextFormField(
                  maxLength: 20,
                  decoration: InputDecoration(
                    labelText: 'Todo Title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18)
                    ),
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      return 'Please enter a todo title';
                    } 
                    return null;
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                ),

                SizedBox(height: 16.0),

                //todo description
                TextFormField(
                  maxLength: 100,
                  decoration: InputDecoration(
                    labelText: 'Todo Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18)
                    ),
                    
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty || value.length < 5) {
                      return 'Please enter a todo description of at least 5 characters';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _description = value!;
                  },
                ),

                SizedBox(height: 16.0),

                //priority dropdown
                DropdownButtonFormField(
                  initialValue: _selectedPriority,
                  items: Priority.values.map((priority) {
                    return DropdownMenuItem(
                      value: priority,
                      child: Text(priority.title),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                       if (value != null) {
                          _selectedPriority = value;
                        }
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Priority',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18)

                    ),
                  ),

                ),


                //submit button
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Handle form submission
                    if(_formGlobalKey.currentState!.validate()){
                      _formGlobalKey.currentState!.save();
                      setState(() {
                        todos.add(Todo(
                          title: _email,
                          description: _description,
                          priority: _selectedPriority
                        ));
                      });

                      _formGlobalKey.currentState!.reset();
                      _selectedPriority = Priority.low;
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 89, 0, 255),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Add Todo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),),
                ),

                SizedBox(height: 50.0)
              ],
            ),
            ),

            // TextField(
            //   controller: _emailController,
            //   keyboardType: TextInputType.emailAddress,
            //   decoration: InputDecoration(
            //     labelText: 'Email',
            //     border: OutlineInputBorder(),
            //     // suffixIcon: Icon(Icons.add),
            //   ),
             
            // ),

            // SizedBox(height: 16.0),

            // // FilledButton(
            // //   onPressed: () {
            // //     setState(() {
            // //       _email = _emailController.text;
            // //     });
            // //   },
            // //   child: Text('Submit'),
            // // ),

            // ElevatedButton(
            //   onPressed: () {
            //     setState(() {
            //       _email = _emailController.text;
            //     });
            //   },
            //   child: Text('Submit'),
            // ),

            // Text(
            //   'Entered Email: $_email',
            //   style: TextStyle(fontSize: 16, color: Colors.deepPurpleAccent),
            // ),

            //   SizedBox(height: 16.0),

          ]
          ),
        ),
      ),
    );
  }
}


class FirebaseCRUD extends StatefulWidget {
  const FirebaseCRUD({super.key});

  @override
  State<FirebaseCRUD> createState() => _FirebaseCRUDState();
}

class _FirebaseCRUDState extends State<FirebaseCRUD> {

final _formGlobalKey = GlobalKey<FormState>();
final TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
String _email = '';
String password = '';

// In initState()
@override
void initState() {
  super.initState();
  _tapGestureRecognizer.onTap = () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUp()),
    );
  };
}

// Don't forget to dispose
@override
void dispose() {
  _tapGestureRecognizer.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Firebase CRUD'),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: Center(
      
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formGlobalKey,
                  child: Column(
                      children : [
                        Text('Login',
                        style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: 44,
                          fontWeight: FontWeight.bold,
                        ),
                        ),

                        SizedBox(height: 56.0),

                        TextFormField(
                          maxLength: 20,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          validator: (value) {
                            if(value == null || value.isEmpty || !value.contains('@')) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _email = value!;
                          },
                        ),

                        SizedBox(height: 16.0),

                        TextFormField(
                          maxLength: 12,
                          obscureText: true,
                          obscuringCharacter: '*',
                          decoration: InputDecoration (
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                          validator: (value) {
                            if(value == null || value.isEmpty || value.length < 8) {
                              return 'Please enter a valid password';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            password = value!;
                          },
                        ),

                        SizedBox(height: 56.0),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurpleAccent,
                            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            elevation: 18,
                            fixedSize: Size(250, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            if(_formGlobalKey.currentState!.validate()) {
                              _formGlobalKey.currentState!.save();
                              print('Email: $_email, Password: $password');
                              _formGlobalKey.currentState!.reset();
                            }
                          },
                          child: Text('Submit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),


                        SizedBox(height: 36.0),

                        RichText(
                          text: TextSpan(
                            text: 'Don\'t have an account? ',
                            style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontSize: 16),
                            children: [
                              TextSpan(
                                text: 'Sign Up',
                                style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 16, fontWeight: FontWeight.bold),
                                recognizer: _tapGestureRecognizer,
                              ),
                            ],
                          ),
                        ),

                      ],
                    
                    
                  ))
              ],
            ),
          ),
        ),
      );
    
  }
}