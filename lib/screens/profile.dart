import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes/util/navigation_container.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // ignore: prefer_typing_uninitialized_variables
  var name, email, photoUrl;

  @override
  Widget build(BuildContext context) {
    User? currentUser = _auth.currentUser;
    String? email;
    if (currentUser != null) {
      // Access the user information
      email = currentUser.email;
    }
    return Scaffold(
      bottomNavigationBar: const NavigationContainer(),
      body: Column(
        children: [
          const Expanded(flex: 2, child: _TopPortion()),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Abraham Maleko',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    email!,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 16.0),
                      FloatingActionButton.extended(
                        onPressed: () {},
                        heroTag: 'mesage',
                        elevation: 0,
                        backgroundColor: Colors.red,
                        label: const Text("Log Out"),
                        icon: const Icon(Icons.logout),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  //  _ProfileInfoRow()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TopPortion extends StatelessWidget {
  const _TopPortion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 50),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Color(0xff0043ba), Color(0xff006df1)]),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 150,
            height: 150,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                              'https://scontent.fdar7-1.fna.fbcdn.net/v/t39.30808-6/326005129_727266755379833_8240995869782050640_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeEMS0fKTeYkH3h4qEffuAKXTVpUVOfVcVhNWlRU59VxWGAMTCiAauSDfSH5S9U5Ue_w5-mgGAqo7raVIT2yZXjM&_nc_ohc=AkISb_p7NBAAX-FfFbM&_nc_ht=scontent.fdar7-1.fna&oh=00_AfAccn0aQ_D4hPAtMibH5Oxip4D0P2BhH664g62ObpwETQ&oe=6467E3A3'
                            )),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
