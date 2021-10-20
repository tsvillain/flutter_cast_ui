class Application {
  final String appId;
  final String appType;
  final String displayName;
  final bool isIdleScreen;
  final bool launchedFromCloud;
  final String sessionId;
  final String statusText;
  final String transportId;
  final String universalAppId;

  Application({
    required this.appId,
    required this.appType,
    required this.displayName,
    required this.isIdleScreen,
    required this.launchedFromCloud,
    required this.sessionId,
    required this.statusText,
    required this.transportId,
    required this.universalAppId,
  });

  factory Application.fromJson(Map<String, dynamic> json) => Application(
        appId: json['appId'].toString(),
        appType: json['appType'].toString(),
        displayName: json['displayName'].toString(),
        isIdleScreen: json['isIdleScreen'] as bool,
        launchedFromCloud: (json['launchedFromCloud'] ?? false) as bool,
        sessionId: json['sessionId'].toString(),
        statusText: json['statusText'].toString(),
        transportId: json['transportId'].toString(),
        universalAppId: json['universalAppId'].toString(),
      );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['appId'] = appId;
    data['appType'] = appType;
    data['displayName'] = displayName;
    data['isIdleScreen'] = isIdleScreen;
    data['launchedFromCloud'] = launchedFromCloud;
    data['sessionId'] = sessionId;
    data['statusText'] = statusText;
    data['transportId'] = transportId;
    data['universalAppId'] = universalAppId;
    return data;
  }
}
