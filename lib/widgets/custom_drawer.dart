import 'package:flutter/material.dart';
import 'package:flutter_social_ui/screens/home_screen.dart';
import 'package:flutter_social_ui/screens/login_screen.dart';
import 'package:flutter_social_ui/screens/profile_screen.dart';

import '../data/data.dart';

class CustomDrawer extends StatelessWidget {
  _builDrawerOption({Icon icon, String title, Function onTap}) {
    return ListTile(
      leading: icon,
      title: Text(title, style: TextStyle(fontSize: 18.0)),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                height: 200.0,
                width: double.infinity,
                image: AssetImage(currentUser.backgroundImageUrl),
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 20.0,
                left: 20.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 3.0,
                        ),
                      ),
                      child: ClipOval(
                        child: Image(
                          height: 100.0,
                          width: 100.0,
                          image: AssetImage(currentUser.profileImageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 6.0),
                    Text(
                      currentUser.name,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          _builDrawerOption(
            icon: Icon(Icons.home),
            title: 'ホーム',
            onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => HomeScreen(),
                )),
          ),
          _builDrawerOption(
            icon: Icon(Icons.chat),
            title: 'チャット',
            onTap: () {},
          ),
          _builDrawerOption(
            icon: Icon(Icons.location_on),
            title: '地図',
            onTap: () {},
          ),
          _builDrawerOption(
            icon: Icon(Icons.account_circle_sharp),
            title: 'プロフィール',
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => ProfileScreen(user: currentUser),
              ),
            ),
          ),
          _builDrawerOption(
            icon: Icon(Icons.settings),
            title: '設定',
            onTap: () {},
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: _builDrawerOption(
                icon: Icon(Icons.directions_run),
                title: 'ログアウト',
                onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LoginScreen(),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
