enum MomentType{trip,birthday,event,goal,personal,other}
class Moment{final String id,title,note;final DateTime date,createdAt;final MomentType type;final bool favorite,saved;
const Moment({required this.id,required this.title,required this.note,required this.date,required this.type,required this.favorite,required this.saved,required this.createdAt});
bool get isPast=>date.isBefore(DateTime.now());int get dayDistance{final n=DateTime.now(),a=DateTime(n.year,n.month,n.day),b=DateTime(date.year,date.month,date.day);return b.difference(a).inDays;}
Moment copyWith({String? title,String? note,DateTime? date,MomentType? type,bool? favorite,bool? saved})=>Moment(id:id,title:title??this.title,note:note??this.note,date:date??this.date,type:type??this.type,favorite:favorite??this.favorite,saved:saved??this.saved,createdAt:createdAt);
Map<String,dynamic> toJson()=>{'id':id,'title':title,'note':note,'date':date.toIso8601String(),'type':type.name,'favorite':favorite,'saved':saved,'createdAt':createdAt.toIso8601String()};
factory Moment.fromJson(Map<String,dynamic> j){final t=MomentType.values.firstWhere((e)=>e.name==(j['type']??'other'),orElse:()=>MomentType.other);return Moment(id:j['id'],title:j['title'],note:j['note']??'',date:DateTime.parse(j['date']),type:t,favorite:j['favorite']??false,saved:j['saved']??false,createdAt:DateTime.parse(j['createdAt']));}}
