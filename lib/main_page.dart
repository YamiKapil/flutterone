import 'package:flutter/material.dart';
import 'package:flutter_one/custom_circular_progress/custom_circular_progress.dart';
import 'package:flutter_one/flutter_mvvm/mvvm_home.dart';
import 'package:flutter_one/flutter_riverpod_app/river_home.dart';
import 'package:flutter_one/flutter_riverpod_app/river_screen/river_movie_list.dart';
import 'package:flutter_one/graph_ql/graph_ql_home.dart';
import 'package:flutter_one/http_delete_method/http_delete_page.dart';
import 'package:flutter_one/isolate_example/isolate_example.dart';
import 'package:flutter_one/note_app/pages/note_page.dart';
import 'package:flutter_one/read_sms/auto_filling_sms.dart';
import 'package:flutter_one/read_sms/read_sms.dart';
import 'package:flutter_one/settings/settings_page.dart';
import 'package:flutter_one/weather_app/weather_pages/weather_home.dart';
import 'package:flutter_one/youtube_video_list/youtube_video_list.dart';
import 'adv_ui_8ball/main_page.dart';
import 'app_tutorial/app_tutorial.dart';
import 'http_post_method/http_post_home.dart';
import 'provider_example/provider_eg.dart';
import 'read_sms/telephony_sms_reader.dart';
import 'responsive_ui/responsive_ui_page.dart';
import 'screen_utils_testing/screen_utils_testing.dart';
import 'sqlite/sqlite_pages/sqlite_home.dart';
import 'widgets/error_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var keyMenu = GlobalKey();
  var keyContainer = GlobalKey();
  var keyChat = GlobalKey();

  List<TutorialItem> items = [];

  @override
  void initState() {
    items.addAll(
      {
        TutorialItem(
          globalKey: keyMenu,
          touchScreen: true,
          top: 200,
          left: 50,
          children: [
            Text(
              "Ali é nosso menu , você consegue ver varias coisas nele",
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
            SizedBox(
              height: 100,
            )
          ],
          widgetNext: Text(
            "Toque para continuar",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          shapeFocus: ShapeFocus.square,
        ),
        TutorialItem(
          globalKey: keyChat,
          touchScreen: true,
          top: 200,
          left: 50,
          children: [
            Text(
              "Qualquer duvida que aparecer , entre no nosso chat , estamos prontos para ajudar",
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
            SizedBox(
              height: 100,
            )
          ],
          widgetNext: Text(
            "Toque para continuar",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          shapeFocus: ShapeFocus.square,
        ),
        TutorialItem(
          globalKey: keyContainer,
          touchScreen: true,
          bottom: 200,
          left: 50,
          children: [
            Text(
              "Nessa sessão você vai ter acesso a todas as  Rasteirinhas",
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            )
          ],
          widgetNext: Text(
            "Sair",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          shapeFocus: ShapeFocus.oval,
        ),
      },
    );

    ///FUNÇÃO QUE EXIBE O TUTORIAL.
    // Future.delayed(Duration(microseconds: 200)).then((value) {
    //   Tutorial.showTutorial(context, items);
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: keyMenu,
        title: const Text('Flutter Apps'),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsPage(),
              ),
            ),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 23.0,
          ),
          child: Center(
            key: keyChat,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotePage(),
                      ),
                    );
                  },
                  child: const Text('Note App'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WeatherHome(),
                      ),
                    );
                  },
                  child: const Text('Weather App'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const YoutubeVideoList(),
                      ),
                    );
                  },
                  child: const Text('Youtube Videos'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ResponsiveUiPage(),
                      ),
                    );
                  },
                  child: const Text('Responsive Ui Page'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProviderExample(),
                      ),
                    );
                  },
                  child: const Text('Provider Example'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyErrorWidget(),
                      ),
                    );
                  },
                  child: const Text('Error Widget Test'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HttpPostHome(),
                      ),
                    );
                  },
                  child: const Text('Http Post Method'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HttpDeletePage(),
                      ),
                    );
                  },
                  child: const Text('Http Delete Method'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GraphQlHome(),
                      ),
                    );
                  },
                  child: const Text('GraphQl Home'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SqliteHome(),
                      ),
                    );
                  },
                  child: const Text('Sqlite'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MvvmHome(),
                      ),
                    );
                  },
                  child: const Text('Flutter MVVM'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ReadSms(),
                      ),
                    );
                  },
                  child: const Text('Read SMS'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // builder: (context) => const AutoFillingSms(),
                        builder: (context) => SmsReader(),
                      ),
                    );
                  },
                  child: const Text('AUto FIll Sms'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // builder: (context) => const AutoFillingSms(),
                        builder: (context) => const TelephonySmsReader(),
                      ),
                    );
                  },
                  child: const Text('Telephony Sms Reader'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // builder: (context) =>  const RiverMovieList(),
                        builder: (context) => RiverHome(),
                      ),
                    );
                  },
                  child: const Text('RiverPod Home'),
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => const ScreenUtilsTesting(),
                //       ),
                //     );
                //   },
                //   child: const Text('Screen Utils Testing'),
                // ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CustomCircularProgress(),
                      ),
                    );
                  },
                  child: const Text('Custom Circular Progress Indicator'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const IsolateExample(),
                      ),
                    );
                  },
                  child: const Text('Isolate/Compute Example'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AdvPageMain(),
                      ),
                    );
                  },
                  child: const Text('8 Ball'),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: false,
      floatingActionButton: FloatingActionButton(
        key: keyContainer,
        child: const Icon(Icons.skip_next),
        onPressed: () async {
          await showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('hello'),
                    ],
                  ),
                );
              });
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              iconSize: 20.0,
              padding: const EdgeInsets.only(left: 28.0),
              icon: const Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              iconSize: 20.0,
              padding: const EdgeInsets.only(right: 28.0),
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              iconSize: 20.0,
              padding: const EdgeInsets.only(left: 28.0),
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            ),
            IconButton(
              iconSize: 20.0,
              padding: const EdgeInsets.only(right: 28.0),
              icon: const Icon(Icons.list),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
