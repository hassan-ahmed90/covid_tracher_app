import 'package:covid_app/WorldStateModel.dart';
import 'package:covid_app/state_services.dart';
import 'package:covid_app/track_countries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class World extends StatefulWidget {
  const World({Key? key}) : super(key: key);

  @override
  State<World> createState() => _WorldState();
}

class _WorldState extends State<World> with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    StateServices stateServices = new StateServices();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Covid Tricker"),
        centerTitle: true,
      ),
        backgroundColor: Colors.grey,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                FutureBuilder(
                    future: stateServices.fetchWorldRecord(),
                    builder: (context,AsyncSnapshot<WorldStateModel>snapshot){
                  if(!snapshot.hasData){
                    return Expanded(
                        flex: 1,
                        child: SpinKitFadingCircle(
                          color: Colors.white,
                          controller: _controller,
                          size: 50,
                    ));

                  }else{
                    return Column(
                      children: [

                        PieChart(
                          dataMap: {
                            "Total":  double.parse(snapshot.data!.cases.toString()) ,
                            "Recovered": double.parse(snapshot.data!.recovered.toString()),
                            "Death :": double.parse(snapshot.data!.deaths.toString()),
                            // "Total": double.parse(snapshot.data!.cases.toString()),
                            // "Recovered": double.parse(snapshot.data!.recovered.toString()),
                            // "Death :": double.parse(snapshot.data!.deaths.toString()),
                          },
                          chartValuesOptions: const ChartValuesOptions(
                            showChartValuesInPercentage: true,
                          ),
                          chartRadius: MediaQuery.of(context).size.width / 3.2,
                          legendOptions:
                          LegendOptions(legendPosition: LegendPosition.left),
                          animationDuration: Duration(milliseconds: 1200),
                        ),
                        SizedBox(height: 20,),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.height * .06),
                          child: Card(
                            color: Colors.grey.shade400,
                            child: Column(
                              children: [
                                Reusable(title: "Total ", value: snapshot.data!.cases.toString()),
                                Reusable(title: "Deaths ", value: snapshot.data!.deaths.toString()),
                                Reusable(title: "Recovered ", value: snapshot.data!.recovered.toString()),
                                Reusable(title: "Active ", value: snapshot.data!.active.toString()),
                                Reusable(title: "Todays Death ", value: snapshot.data!.todayDeaths.toString()),
                                Reusable(title: "Todays Recovered ", value: snapshot.data!.todayRecovered.toString()),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 40,),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>TrackCountries()));
                          },
                          child: Container(
                            height: 50,
                            width: 300,

                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15),
                            ),child: Center(child: Text("Track",style: TextStyle(color: Colors.white,fontSize: 20),),),
                          ),
                        )

                      ],
                    );

                  }
                }),

              ],
            ),
          ),
        ));
  }
}

class Reusable extends StatelessWidget {
  String title, value;
  Reusable({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),

            //SizedBox(width: 5,),
          //Divider()
        ],
      ),

    );
  }
}
