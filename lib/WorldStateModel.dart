import 'dart:convert';
/// updated : 1673006178923
/// cases : 667506146
/// todayCases : 380821
/// deaths : 6707363
/// todayDeaths : 860
/// recovered : 638928286
/// todayRecovered : 141993
/// active : 21870497
/// critical : 43878
/// casesPerOneMillion : 85635
/// deathsPerOneMillion : 860.5
/// tests : 6891581585
/// testsPerOneMillion : 867418.23
/// population : 7944935131
/// oneCasePerPeople : 0
/// oneDeathPerPeople : 0
/// oneTestPerPeople : 0
/// activePerOneMillion : 2752.76
/// recoveredPerOneMillion : 80419.57
/// criticalPerOneMillion : 5.52
/// affectedCountries : 231

WorldStateModel worldStateModelFromJson(String str) => WorldStateModel.fromJson(json.decode(str));
String worldStateModelToJson(WorldStateModel data) => json.encode(data.toJson());
class WorldStateModel {
  WorldStateModel({
      num? updated, 
      num? cases, 
      num? todayCases, 
      num? deaths, 
      num? todayDeaths, 
      num? recovered, 
      num? todayRecovered, 
      num? active, 
      num? critical, 
      num? casesPerOneMillion, 
      num? deathsPerOneMillion, 
      num? tests, 
      num? testsPerOneMillion, 
      num? population, 
      num? oneCasePerPeople, 
      num? oneDeathPerPeople, 
      num? oneTestPerPeople, 
      num? activePerOneMillion, 
      num? recoveredPerOneMillion, 
      num? criticalPerOneMillion, 
      num? affectedCountries,}){
    _updated = updated;
    _cases = cases;
    _todayCases = todayCases;
    _deaths = deaths;
    _todayDeaths = todayDeaths;
    _recovered = recovered;
    _todayRecovered = todayRecovered;
    _active = active;
    _critical = critical;
    _casesPerOneMillion = casesPerOneMillion;
    _deathsPerOneMillion = deathsPerOneMillion;
    _tests = tests;
    _testsPerOneMillion = testsPerOneMillion;
    _population = population;
    _oneCasePerPeople = oneCasePerPeople;
    _oneDeathPerPeople = oneDeathPerPeople;
    _oneTestPerPeople = oneTestPerPeople;
    _activePerOneMillion = activePerOneMillion;
    _recoveredPerOneMillion = recoveredPerOneMillion;
    _criticalPerOneMillion = criticalPerOneMillion;
    _affectedCountries = affectedCountries;
}

  WorldStateModel.fromJson(dynamic json) {
    _updated = json['updated'];
    _cases = json['cases'];
    _todayCases = json['todayCases'];
    _deaths = json['deaths'];
    _todayDeaths = json['todayDeaths'];
    _recovered = json['recovered'];
    _todayRecovered = json['todayRecovered'];
    _active = json['active'];
    _critical = json['critical'];
    _casesPerOneMillion = json['casesPerOneMillion'];
    _deathsPerOneMillion = json['deathsPerOneMillion'];
    _tests = json['tests'];
    _testsPerOneMillion = json['testsPerOneMillion'];
    _population = json['population'];
    _oneCasePerPeople = json['oneCasePerPeople'];
    _oneDeathPerPeople = json['oneDeathPerPeople'];
    _oneTestPerPeople = json['oneTestPerPeople'];
    _activePerOneMillion = json['activePerOneMillion'];
    _recoveredPerOneMillion = json['recoveredPerOneMillion'];
    _criticalPerOneMillion = json['criticalPerOneMillion'];
    _affectedCountries = json['affectedCountries'];
  }
  num? _updated;
  num? _cases;
  num? _todayCases;
  num? _deaths;
  num? _todayDeaths;
  num? _recovered;
  num? _todayRecovered;
  num? _active;
  num? _critical;
  num? _casesPerOneMillion;
  num? _deathsPerOneMillion;
  num? _tests;
  num? _testsPerOneMillion;
  num? _population;
  num? _oneCasePerPeople;
  num? _oneDeathPerPeople;
  num? _oneTestPerPeople;
  num? _activePerOneMillion;
  num? _recoveredPerOneMillion;
  num? _criticalPerOneMillion;
  num? _affectedCountries;
WorldStateModel copyWith({  num? updated,
  num? cases,
  num? todayCases,
  num? deaths,
  num? todayDeaths,
  num? recovered,
  num? todayRecovered,
  num? active,
  num? critical,
  num? casesPerOneMillion,
  num? deathsPerOneMillion,
  num? tests,
  num? testsPerOneMillion,
  num? population,
  num? oneCasePerPeople,
  num? oneDeathPerPeople,
  num? oneTestPerPeople,
  num? activePerOneMillion,
  num? recoveredPerOneMillion,
  num? criticalPerOneMillion,
  num? affectedCountries,
}) => WorldStateModel(  updated: updated ?? _updated,
  cases: cases ?? _cases,
  todayCases: todayCases ?? _todayCases,
  deaths: deaths ?? _deaths,
  todayDeaths: todayDeaths ?? _todayDeaths,
  recovered: recovered ?? _recovered,
  todayRecovered: todayRecovered ?? _todayRecovered,
  active: active ?? _active,
  critical: critical ?? _critical,
  casesPerOneMillion: casesPerOneMillion ?? _casesPerOneMillion,
  deathsPerOneMillion: deathsPerOneMillion ?? _deathsPerOneMillion,
  tests: tests ?? _tests,
  testsPerOneMillion: testsPerOneMillion ?? _testsPerOneMillion,
  population: population ?? _population,
  oneCasePerPeople: oneCasePerPeople ?? _oneCasePerPeople,
  oneDeathPerPeople: oneDeathPerPeople ?? _oneDeathPerPeople,
  oneTestPerPeople: oneTestPerPeople ?? _oneTestPerPeople,
  activePerOneMillion: activePerOneMillion ?? _activePerOneMillion,
  recoveredPerOneMillion: recoveredPerOneMillion ?? _recoveredPerOneMillion,
  criticalPerOneMillion: criticalPerOneMillion ?? _criticalPerOneMillion,
  affectedCountries: affectedCountries ?? _affectedCountries,
);
  num? get updated => _updated;
  num? get cases => _cases;
  num? get todayCases => _todayCases;
  num? get deaths => _deaths;
  num? get todayDeaths => _todayDeaths;
  num? get recovered => _recovered;
  num? get todayRecovered => _todayRecovered;
  num? get active => _active;
  num? get critical => _critical;
  num? get casesPerOneMillion => _casesPerOneMillion;
  num? get deathsPerOneMillion => _deathsPerOneMillion;
  num? get tests => _tests;
  num? get testsPerOneMillion => _testsPerOneMillion;
  num? get population => _population;
  num? get oneCasePerPeople => _oneCasePerPeople;
  num? get oneDeathPerPeople => _oneDeathPerPeople;
  num? get oneTestPerPeople => _oneTestPerPeople;
  num? get activePerOneMillion => _activePerOneMillion;
  num? get recoveredPerOneMillion => _recoveredPerOneMillion;
  num? get criticalPerOneMillion => _criticalPerOneMillion;
  num? get affectedCountries => _affectedCountries;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['updated'] = _updated;
    map['cases'] = _cases;
    map['todayCases'] = _todayCases;
    map['deaths'] = _deaths;
    map['todayDeaths'] = _todayDeaths;
    map['recovered'] = _recovered;
    map['todayRecovered'] = _todayRecovered;
    map['active'] = _active;
    map['critical'] = _critical;
    map['casesPerOneMillion'] = _casesPerOneMillion;
    map['deathsPerOneMillion'] = _deathsPerOneMillion;
    map['tests'] = _tests;
    map['testsPerOneMillion'] = _testsPerOneMillion;
    map['population'] = _population;
    map['oneCasePerPeople'] = _oneCasePerPeople;
    map['oneDeathPerPeople'] = _oneDeathPerPeople;
    map['oneTestPerPeople'] = _oneTestPerPeople;
    map['activePerOneMillion'] = _activePerOneMillion;
    map['recoveredPerOneMillion'] = _recoveredPerOneMillion;
    map['criticalPerOneMillion'] = _criticalPerOneMillion;
    map['affectedCountries'] = _affectedCountries;
    return map;
  }

}