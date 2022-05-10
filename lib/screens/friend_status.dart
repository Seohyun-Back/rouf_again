import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gw/globals.dart' as globals;

class FriendStatus extends StatefulWidget {
  const FriendStatus({Key? key}) : super(key: key);

  @override
  State<FriendStatus> createState() => _FriendStatusState();
}

class _FriendStatusState extends State<FriendStatus> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    print('\n \n currentUid는 지금 ${globals.currentUid}');
    print('\n \n currentUsername은 지금 ${globals.currentUsername}');
    print('\n \n currentEmail은 지금 ${globals.currentEmail}');
    return Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('user/${globals.currentUid}/friends')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final docs = snapshot.data!.docs;

                return Container(
                  height: 218,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      return StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('user')
                              .doc('${docs[index]['uid']}')
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<
                                      DocumentSnapshot<Map<String, dynamic>>>
                                  snapshot2) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            final int actionKey = snapshot2.data!['statusKey'];

                            return Container(
                                //padding:,
                                child: ListTile(
                              // 친구 프로필사진
                              leading: Icon(
                                Icons.circle,
                                size: 20.0,
                                color: Colors.grey[850],
                              ),
                              // 친구 이름
                              title: Text(
                                  docs[index]['name'] +
                                      '는 ' +
                                      globals.action[actionKey],
                                  style: TextStyle(fontSize: 20)),
                            ));
                          });
                    },
                  ),
                );
              },
            )
          ],
        ));
  }
}
