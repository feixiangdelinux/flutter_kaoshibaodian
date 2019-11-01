class UserLoginEntity {
	String msg;
	UserLoginBeanData data;
	int status;

	UserLoginEntity({this.msg, this.data, this.status});

	UserLoginEntity.fromJson(Map<String, dynamic> json) {
		msg = json['msg'];
		data = json['data'] != null ? new UserLoginBeanData.fromJson(json['data']) : null;
		status = json['status'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['msg'] = this.msg;
		if (this.data != null) {
      data['data'] = this.data.toJson();
    }
		data['status'] = this.status;
		return data;
	}
}

class UserLoginBeanData {
	int appVn;
	String appCName;
	String appEName;
	String appName;
	int appID;
	String goApp;
	String guid;
	String nickName;
	int userID;
	bool isVip;

	UserLoginBeanData({this.appVn, this.appCName, this.appEName, this.appName, this.appID, this.goApp, this.guid, this.nickName, this.userID, this.isVip});

	UserLoginBeanData.fromJson(Map<String, dynamic> json) {
		appVn = json['appVn'];
		appCName = json['appCName'];
		appEName = json['appEName'];
		appName = json['appName'];
		appID = json['appID'];
		goApp = json['goApp'];
		guid = json['guid'];
		nickName = json['NickName'];
		userID = json['userID'];
		isVip = json['isVip'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['appVn'] = this.appVn;
		data['appCName'] = this.appCName;
		data['appEName'] = this.appEName;
		data['appName'] = this.appName;
		data['appID'] = this.appID;
		data['goApp'] = this.goApp;
		data['guid'] = this.guid;
		data['NickName'] = this.nickName;
		data['userID'] = this.userID;
		data['isVip'] = this.isVip;
		return data;
	}
}
