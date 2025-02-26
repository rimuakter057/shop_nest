
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_nest/features/authentication/model/football_score_model.dart';


class TeamListScreen extends StatefulWidget {
  const TeamListScreen({super.key});

  @override
  State<TeamListScreen> createState() => _TeamListScreenState();
}

class _TeamListScreenState extends State<TeamListScreen> {
  FirebaseFirestore bd = FirebaseFirestore.instance;
  List<FootballScore> _footballScoreList = [];
  bool _getInProgress = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getLiveScoreList();
  }

  Future <void> _getLiveScoreList()async{
    _getInProgress = true;
    setState(() {

    });
    _footballScoreList.clear();
try{
  QuerySnapshot <Map<String,dynamic>> snapshots = await bd.collection('Football').get();
  for (QueryDocumentSnapshot<Map<String,dynamic>> doc in snapshots.docs){
_footballScoreList.add(FootballScore.fromJson(doc.data(), doc.id));
  }
  _getInProgress = false;
  setState(() {

  });
}catch(e){
  print("No data avaiable");
}

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:/*Visibility(
        visible: _getInProgress==false,
        replacement: Center(child: CircularProgressIndicator(),),
        child: ListView.builder(
          itemCount: _footballScoreList.length,
          itemBuilder: (context,index){
            FootballScore score = _footballScoreList[index];
          return ListTile(
            title: Text(score.team1Name),
            subtitle: Text(score.team1Score.toString()),
            trailing: Text(score.team2Score.toString()),
          );
        },
        ),
      ),*/

       Visibility(
        visible: _getInProgress == false,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: _footballScoreList.length,
          itemBuilder: (context, index) {
            FootballScore score = _footballScoreList[index];
            return ListTile(
              title: Text(score.matchName),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${score.team1Name} vs ${score.team2Name}'),
                  if (score.isRunning == false)
                    Text('Winner team is ${score.winnerTeam}')
                ],
              ),
              trailing: Text(
                '${score.team1Score}-${score.team2Score}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              leading: CircleAvatar(
                backgroundColor: score.isRunning ? Colors.green : Colors.grey,
                radius: 10,
              ),
            );
          },
        ),
      ),
    );
  }
}
