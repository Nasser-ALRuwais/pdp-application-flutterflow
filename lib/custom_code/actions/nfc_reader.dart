// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';
import 'package:nfc_manager/nfc_manager.dart';

Future nfcReader() async {
  NfcManager.instance.startSession(
    pollingOptions: {
      NfcPollingOption.iso14443,
      NfcPollingOption.iso15693,
      NfcPollingOption.iso18092,
    },
    onDiscovered: (NfcTag tag) async {
      try {
        if (tag.data["ndef"]["cachedMessage"] != null) {
          var tagValue = String.fromCharCodes(
                  tag.data["ndef"]["cachedMessage"]["records"][0]["payload"])
              .substring(3);
          print(tagValue);
          if (tagValue == 'chatPDP') {
            final fire = FirebaseFirestore.instance;
            final currentUser = FirebaseAuth.instance.currentUser;

            fire
                .collection("users")
                .doc(currentUser!.uid)
                .update({'attended': true});
          }
        }
        NfcManager.instance.stopSession();
      } catch (e) {
        print("------");
        print(e);
      }
    },
  );
}
