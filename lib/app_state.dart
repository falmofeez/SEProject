import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _addFav = prefs.getBool('ff_addFav') ?? _addFav;
    });
    _safeInit(() {
      _initialSearchJ1 =
          prefs.getString('ff_initialSearchJ1') ?? _initialSearchJ1;
    });
    _safeInit(() {
      _intialSearchJOP =
          prefs.getString('ff_intialSearchJOP') ?? _intialSearchJOP;
    });
    _safeInit(() {
      _intialSearchDataS =
          prefs.getString('ff_intialSearchDataS') ?? _intialSearchDataS;
    });
    _safeInit(() {
      _savedToFav = prefs
              .getStringList('ff_savedToFav')
              ?.map((path) => path.ref)
              .toList() ??
          _savedToFav;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _addFav = false;
  bool get addFav => _addFav;
  set addFav(bool _value) {
    _addFav = _value;
    prefs.setBool('ff_addFav', _value);
  }

  String _courseName1 = 'Introduction To Programming';
  String get courseName1 => _courseName1;
  set courseName1(String _value) {
    _courseName1 = _value;
  }

  List<dynamic> _SearchResults = [];
  List<dynamic> get SearchResults => _SearchResults;
  set SearchResults(List<dynamic> _value) {
    _SearchResults = _value;
  }

  void addToSearchResults(dynamic _value) {
    _SearchResults.add(_value);
  }

  void removeFromSearchResults(dynamic _value) {
    _SearchResults.remove(_value);
  }

  void removeAtIndexFromSearchResults(int _index) {
    _SearchResults.removeAt(_index);
  }

  void updateSearchResultsAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _SearchResults[_index] = updateFn(_SearchResults[_index]);
  }

  void insertAtIndexInSearchResults(int _index, dynamic _value) {
    _SearchResults.insert(_index, _value);
  }

  String _initialSearchJ1 = 'introduction to Java programming';
  String get initialSearchJ1 => _initialSearchJ1;
  set initialSearchJ1(String _value) {
    _initialSearchJ1 = _value;
    prefs.setString('ff_initialSearchJ1', _value);
  }

  String _intialSearchJOP = 'Java oriented programming';
  String get intialSearchJOP => _intialSearchJOP;
  set intialSearchJOP(String _value) {
    _intialSearchJOP = _value;
    prefs.setString('ff_intialSearchJOP', _value);
  }

  String _intialSearchDataS = 'Data Structures ';
  String get intialSearchDataS => _intialSearchDataS;
  set intialSearchDataS(String _value) {
    _intialSearchDataS = _value;
    prefs.setString('ff_intialSearchDataS', _value);
  }

  int _completedQue = 0;
  int get completedQue => _completedQue;
  set completedQue(int _value) {
    _completedQue = _value;
  }

  int _scoore = 0;
  int get scoore => _scoore;
  set scoore(int _value) {
    _scoore = _value;
  }

  String _coursename2 = 'Object Oriented Programming';
  String get coursename2 => _coursename2;
  set coursename2(String _value) {
    _coursename2 = _value;
  }

  String _coursename3 = 'Data Structures';
  String get coursename3 => _coursename3;
  set coursename3(String _value) {
    _coursename3 = _value;
  }

  List<DocumentReference> _savedToFav = [];
  List<DocumentReference> get savedToFav => _savedToFav;
  set savedToFav(List<DocumentReference> _value) {
    _savedToFav = _value;
    prefs.setStringList('ff_savedToFav', _value.map((x) => x.path).toList());
  }

  void addToSavedToFav(DocumentReference _value) {
    _savedToFav.add(_value);
    prefs.setStringList(
        'ff_savedToFav', _savedToFav.map((x) => x.path).toList());
  }

  void removeFromSavedToFav(DocumentReference _value) {
    _savedToFav.remove(_value);
    prefs.setStringList(
        'ff_savedToFav', _savedToFav.map((x) => x.path).toList());
  }

  void removeAtIndexFromSavedToFav(int _index) {
    _savedToFav.removeAt(_index);
    prefs.setStringList(
        'ff_savedToFav', _savedToFav.map((x) => x.path).toList());
  }

  void updateSavedToFavAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _savedToFav[_index] = updateFn(_savedToFav[_index]);
    prefs.setStringList(
        'ff_savedToFav', _savedToFav.map((x) => x.path).toList());
  }

  void insertAtIndexInSavedToFav(int _index, DocumentReference _value) {
    _savedToFav.insert(_index, _value);
    prefs.setStringList(
        'ff_savedToFav', _savedToFav.map((x) => x.path).toList());
  }

  final _userDocQueryManager = FutureRequestManager<UserRecord>();
  Future<UserRecord> userDocQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<UserRecord> Function() requestFn,
  }) =>
      _userDocQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserDocQueryCache() => _userDocQueryManager.clear();
  void clearUserDocQueryCacheKey(String? uniqueKey) =>
      _userDocQueryManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
