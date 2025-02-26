class FootballScore {
  final String  matchName;
  final String team1Name;
  final String team2Name;
  final int team1Score;
  final int team2Score;
  final String winnerTeam;
  final bool isRunning;

  FootballScore(
      {
        required this.matchName,
        required this.team1Name,
      required this.team2Name,
      required this.team1Score,
      required this.team2Score,
      required this.winnerTeam,
      required this.isRunning});


 factory FootballScore.fromJson(Map<String, dynamic> json,String matchName){
    return FootballScore(
        team1Name: json['team1'],
        team2Name: json['team2'],
        team1Score: json['team1_score'],
        team2Score: json['team2_score'],
        winnerTeam: json['winner']??'no winner team',
        isRunning: json['is_running'],
        matchName: matchName,
    );
  }





}
