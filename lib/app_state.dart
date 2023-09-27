import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

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
      _conferenceDate = prefs.containsKey('ff_conferenceDate')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_conferenceDate')!)
          : _conferenceDate;
    });
    _safeInit(() {
      _firstTime = prefs.getBool('ff_firstTime') ?? _firstTime;
    });
    _safeInit(() {
      _firstTimeSocial =
          prefs.getBool('ff_firstTimeSocial') ?? _firstTimeSocial;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DateTime? _conferenceDate =
      DateTime.fromMillisecondsSinceEpoch(1701057600000);
  DateTime? get conferenceDate => _conferenceDate;
  set conferenceDate(DateTime? _value) {
    _conferenceDate = _value;
    _value != null
        ? prefs.setInt('ff_conferenceDate', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_conferenceDate');
  }

  bool _firstTime = false;
  bool get firstTime => _firstTime;
  set firstTime(bool _value) {
    _firstTime = _value;
    prefs.setBool('ff_firstTime', _value);
  }

  bool _firstTimeSocial = false;
  bool get firstTimeSocial => _firstTimeSocial;
  set firstTimeSocial(bool _value) {
    _firstTimeSocial = _value;
    prefs.setBool('ff_firstTimeSocial', _value);
  }

  final _socialCacheManager = FutureRequestManager<List<PostsRecord>>();
  Future<List<PostsRecord>> socialCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<PostsRecord>> Function() requestFn,
  }) =>
      _socialCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSocialCacheCache() => _socialCacheManager.clear();
  void clearSocialCacheCacheKey(String? uniqueKey) =>
      _socialCacheManager.clearRequest(uniqueKey);

  final _postCacheManager = FutureRequestManager<UsersRecord>();
  Future<UsersRecord> postCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<UsersRecord> Function() requestFn,
  }) =>
      _postCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPostCacheCache() => _postCacheManager.clear();
  void clearPostCacheCacheKey(String? uniqueKey) =>
      _postCacheManager.clearRequest(uniqueKey);

  final _descriptionCacheManager =
      FutureRequestManager<List<ConferenceInfoRecord>>();
  Future<List<ConferenceInfoRecord>> descriptionCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<ConferenceInfoRecord>> Function() requestFn,
  }) =>
      _descriptionCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearDescriptionCacheCache() => _descriptionCacheManager.clear();
  void clearDescriptionCacheCacheKey(String? uniqueKey) =>
      _descriptionCacheManager.clearRequest(uniqueKey);
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
