import 'package:flutter/material.dart';

//Colors
const kPrimaryColor = Color.fromARGB(159, 46, 42, 19);
const kPrimaryLightColor = Color.fromARGB(255, 223, 223, 190);
const txtColorDark = Color.fromARGB(255, 54, 54, 29);
const txtColorLight = Color.fromARGB(255, 255, 255, 217);
const txtColorWhite = Color.fromARGB(255, 255, 255, 255);
const darkBackground = Color.fromARGB(255, 40, 40, 32);
const lightBackground = Color.fromARGB(255, 253, 253, 235);
const headerBackgroundColor = Color.fromARGB(255, 117, 117, 88);

//User API Endpoints
// const baseURL = "http://127.0.0.1:8000";
const baseURL = "http://144.126.210.250/api/public";
const loginURL = baseURL + '/api/login';
const registerURL = baseURL + '/api/register';
const logoutURL = baseURL + '/api/logout';
const userURL = baseURL + '/api/getUser';

//Notes API Endpoints
const addNoteURL = baseURL + '/api/addnote';
const getNotesURL = baseURL + '/api/getnotes';
