import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/widgets/arrowOnTop.dart';
import 'package:my_portfolio/widgets/footer.dart';
import "package:universal_html/html.dart" as html;
import 'package:flutter/material.dart';
import 'package:my_portfolio/animations/EntranceFader.dart';
import 'package:my_portfolio/sections/about/about.dart';
import 'package:my_portfolio/sections/contact/contact.dart';
import 'package:my_portfolio/sections/home/home.dart';
import 'package:my_portfolio/sections/navBar/navBarLogo.dart';
import 'package:my_portfolio/sections/portfolio/portfolio.dart';
import 'package:my_portfolio/services/services.dart';
import 'package:my_portfolio/widgets/constants.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ScrollController _scrollController =
      ScrollController(initialScrollOffset: 25.0);
  ItemScrollController _itemScrollController = ItemScrollController();
  ItemPositionsListener _itemPositionsListener = ItemPositionsListener.create();

  final List<String> _sectionName = [
    "Home",
    "About",
    "Services",
    "Projects",
    "Contact"
  ];

  final List<IconData> _sectionsIcons = [
    Icons.home,
    Icons.person,
    Icons.settings,
    Icons.build,
    Icons.phone,
  ];

  void _scroll(int i) {
    _itemScrollController.scrollTo(index: i, duration: Duration(seconds: 1));
  }

  Widget sectionWidget(int i) {
    if (i == 0) {
      return HomePage();
    } else if (i == 1) {
      return About();
    } else if (i == 2) {
      return Services();
    } else if (i == 3) {
      return Portfolio();
    } else if (i == 4) {
      return Contact();
    } else if (i == 5) {
      return SizedBox(
        height: 40.0,
      );
    } else if (i == 6) {
      return ArrowOnTop(
        onPressed: () => _scroll(0),
      );
    } else if (i == 7) {
      return Footer();
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: MediaQuery.of(context).size.width > 760
          ? _appBarTabDesktop()
          : AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
      drawer: MediaQuery.of(context).size.width < 760 ? _appBarMobile() : null,
      body: RawScrollbar(
          controller: _scrollController,
          thumbColor: kPrimaryColor,
          thickness: 5.0,
          child: ScrollablePositionedList.builder(
              itemScrollController: _itemScrollController,
              itemPositionsListener: _itemPositionsListener,
              itemCount: 8,
              itemBuilder: (context, index) {
                return sectionWidget(index);
              })),
    );
  }

  AppBar _appBarTabDesktop() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      title: MediaQuery.of(context).size.width < 740
          ? EntranceFader(
              duration: Duration(seconds: 1),
              offset: Offset(0, -20),
              delay: Duration(seconds: 3),
              child: NavBarLogo())
          : EntranceFader(
              offset: Offset(0, -20),
              duration: Duration(seconds: 1),
              delay: Duration(seconds: 3),
              child: NavBarLogo(),
            ),
      actions: [
        for (int i = 0; i < _sectionName.length; i++)
          _appBarActions(_sectionName[i], i, _sectionsIcons[i]),
        EntranceFader(
          offset: Offset(0, -20),
          delay: Duration(seconds: 3),
          duration: Duration(seconds: 1),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              hoverColor: kPrimaryColor.withAlpha(150),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(color: kPrimaryColor)),
              onPressed: () {
                html.window.open(
                    'https://drive.google.com/drive/folders/1smuJ0sf0vqcIKKAs5Uc0jsBqTUTq3cYj',
                    'pdf');
              },
              child: Text(
                "Resume",
                style: GoogleFonts.montserrat(fontWeight: FontWeight.w200),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _appBarActions(String childText, int index, IconData icon) {
    return MediaQuery.of(context).size.width > 760
        ? EntranceFader(
            offset: Offset(0, -20),
            delay: Duration(seconds: 3),
            duration: Duration(seconds: 1),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                hoverColor: kPrimaryColor,
                onPressed: () => _scroll(index),
                child: Text(
                  childText,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.all(8.0),
            child: MaterialButton(
              hoverColor: kPrimaryColor,
              onPressed: () => _scroll(index),
              child: ListTile(
                leading: Icon(
                  icon,
                  color: kPrimaryColor,
                ),
                title: Text(childText),
              ),
            ),
          );
  }

  _appBarMobile() {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: NavBarLogo(
                height: 28,
              ),
            ),
            for (int i = 0; i < _sectionName.length; i++)
              _appBarActions(_sectionName[i], i, _sectionsIcons[i]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                hoverColor: kPrimaryColor.withAlpha(150),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(color: kPrimaryColor),
                ),
                onPressed: () {
                  html.window.open(
                      'https://drive.google.com/drive/folders/1smuJ0sf0vqcIKKAs5Uc0jsBqTUTq3cYj',
                      'pdf');
                },
                child: ListTile(
                  leading: Icon(
                    Icons.book,
                    color: Colors.red,
                  ),
                  title: Text(
                    "Resume",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
