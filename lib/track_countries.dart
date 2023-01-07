import 'package:covid_app/detail_screen.dart';
import 'package:covid_app/state_services.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TrackCountries extends StatefulWidget {
  const TrackCountries({Key? key}) : super(key: key);

  @override
  State<TrackCountries> createState() => _TrackCountriesState();
}

class _TrackCountriesState extends State<TrackCountries> with TickerProviderStateMixin{
  late final AnimationController _controller =
  AnimationController(duration: Duration(seconds: 3), vsync: this)
    ..repeat();
  TextEditingController searchContrller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StateServices stateServices = new StateServices();
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Countries Api"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(10),
            child: TextFormField(
              onChanged: (value){
                setState(() {

                });
              },
              controller: searchContrller,
              decoration: InputDecoration(
                hintText: " Search Country ",
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50)
                )
              ),
            ),),
            Expanded(child: FutureBuilder(
              future: stateServices.CountryRecordApi(),
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot ){
                if(!snapshot.hasData){
                  return ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index){

                   return Shimmer.fromColors(child: Column(
                      children: [
                        ListTile(
                          title: Container(height: 10,width: 89, color: Colors.grey,),
                          subtitle: Container(height: 10,width: 89, color: Colors.grey,),
                          leading: Container(height: 100,width: 89, color: Colors.grey,),
                        )
                      ],
                    ),
                        baseColor: Colors.grey.shade700, highlightColor: Colors.grey.shade100);
                  });
                }else{
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context,index){
                        String name = snapshot.data![index]['country'];
                        if(searchContrller.text.isEmpty){
                          return InkWell(
                            child: Column(
                          children: [
                          ListTile(
                          leading: Image(
                            height: 50,
                            width: 50,
                            image: NetworkImage(
                                snapshot.data![index]['countryInfo']['flag']
                            ),
                          ),
                        title: Text(snapshot.data![index]['country']),
                        subtitle: Text(snapshot.data![index]['cases'].toString()),
                        )

                        ],
                        ),
                            onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return DetailScreen(
                                 image: snapshot.data![index]['countryInfo']['flag'],
                                 name: snapshot.data![index]['country'],
                                cases: snapshot.data![index]['cases'],
                                recovered: snapshot.data![index]['recovered'],
                                active: snapshot.data![index]['active'],
                                test: snapshot.data![index]['tests'],
                                critical: snapshot.data![index]['critical'],
                                // test: snapshot.data![index]['tests'],
                                 todayRecovered: snapshot.data![index]['todayRecovered'],
                                // totalCases: snapshot.data![index]['cases'],
                                 totalDeaths: snapshot.data![index]['deaths'],
                                totalCases: snapshot.data![index]['todayCases'],
                                // totalRecovered: snapshot.data![index]['totalRecovered'],
                                // active: snapshot.data![index]['active'],
                                // critical: snapshot.data![index]['critical'],


                              );
                            }));
                            },
                          );
                        }else if(name.toLowerCase().contains(searchContrller.text.toLowerCase())){
                          return InkWell(
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Image(
                                    height: 50,
                                    width: 50,
                                    image: NetworkImage(
                                        snapshot.data![index]['countryInfo']['flag']
                                    ),
                                  ),
                                  title: Text(snapshot.data![index]['country']),
                                  subtitle: Text(snapshot.data![index]['cases'].toString()),
                                )

                              ],
                            ),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return DetailScreen(

                                  totalCases: snapshot.data![index]['todayCases'],
                                  image: snapshot.data![index]['countryInfo']['flag'],
                                  name: snapshot.data![index]['country'],
                                  cases: snapshot.data![index]['cases'],
                                  recovered: snapshot.data![index]['recovered'],
                                  active: snapshot.data![index]['active'],
                                  test: snapshot.data![index]['tests'],
                                  critical: snapshot.data![index]['critical'],
                                  totalDeaths: snapshot.data![index]['todayDeaths'],
                                  todayRecovered:  snapshot.data![index]['todayRecovered'],
                                  // test: snapshot.data![index]['tests'],
                                  // todayRecovered: snapshot.data![index]['todayRecovered'],
                                  // totalCases: snapshot.data![index]['cases'],
                                  // totalDeaths: snapshot.data![index]['deaths'],
                                  // totalRecovered: snapshot.data![index]['totalRecovered'],
                                  // active: snapshot.data![index]['active'],
                                  // critical: snapshot.data![index]['critical'],


                                );
                              }));
                            },
                          );
                        }else{
                       return Container();
                        }

                  });
                }
              },
            ))
          ],
        ),
      )
    );
  }
}
