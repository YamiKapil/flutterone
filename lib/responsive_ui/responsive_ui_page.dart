import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_one/widgets/error_widget.dart';
import 'package:flutter_one/responsive_ui/size_config.dart';

class ResponsiveUiPage extends StatelessWidget {
  const ResponsiveUiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Responsive UI'),
      // ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10 * SizeConfig.widthMultiplier!,
                  vertical: 1 * SizeConfig.heightMultiplier!,
                ),
                child: Text(
                  'Welcome to Getting Started Screen',
                  style: TextStyle(
                    fontSize: 2.2 * SizeConfig.textMultiplier!,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 1 * SizeConfig.heightMultiplier!,
                    horizontal: 2 * SizeConfig.widthMultiplier!,
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://images.unsplash.com/photo-1603344204980-4edb0ea63148?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80',
                    fit: BoxFit.contain,
                    placeholder: (context, _) => const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 2 * SizeConfig.heightMultiplier!,
                  horizontal: 10 * SizeConfig.widthMultiplier!,
                ),
                child: Text(
                  'This is the first onboarding screen of this app, use the below arrows to navigate between the onboarding screens.',
                  style: TextStyle(
                    fontSize: 2 * SizeConfig.textMultiplier!,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                // height: 6.2 * SizeConfig.heightMultiplier!,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(4 * SizeConfig.heightMultiplier!),
                  ),
                  color: Colors.blueAccent,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyErrorWidget(),
                            ),
                          );
                          print('Left arrow pressed');
                        },
                        icon: Icon(
                          Icons.keyboard_arrow_left,
                          size: 8 * SizeConfig.imageSizeMultiplier!,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      'Getting Started',
                      style: TextStyle(
                        fontSize: 2 * SizeConfig.textMultiplier!,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyErrorWidget(),
                            ),
                          );
                          print('Right arrow pressed');
                        },
                        icon: Icon(
                          Icons.keyboard_arrow_right,
                          size: 8 * SizeConfig.imageSizeMultiplier!.toDouble(),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
