#!/bin/bash
dart compile js web/game.dart -o web/main.dart.js
dart pub global run webdev serve web:8080 
