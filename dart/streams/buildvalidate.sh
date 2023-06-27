#!/bin/bash
dart compile js web/validate.dart -o web/main.dart.js
dart pub global run webdev serve web:8080 
