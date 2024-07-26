import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

const String url='https://rbbtxeqdjrueufyrxjsa.supabase.co';
const String apikey='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJiYnR4ZXFkanJ1ZXVmeXJ4anNhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjA2MTcyODQsImV4cCI6MjAzNjE5MzI4NH0.sDg4CXt0sCHzh71XVVZns7sXFS2NC2ujcFXQQTYIXBs';
const String apTableNotification='https://rbbtxeqdjrueufyrxjsa.supabase.co/rest/v1/notification';
const String apiTableUsersInfo='https://rbbtxeqdjrueufyrxjsa.supabase.co/rest/v1/users_information';
const String apiTableUsersAndForms='https://rbbtxeqdjrueufyrxjsa.supabase.co/rest/v1/uses_and_forms';
const String apiTableForms='https://rbbtxeqdjrueufyrxjsa.supabase.co/rest/v1/forms';

String tokenNotification='';

//form 
const String allForms="  All Forms ";
const String editFormString="* If you want to edit the form , click on icon * ";
const String type="Type";
const String speicalType="Special type";
const String errorS="error";
const String addFormS="Add Form";
const String nameFormS="Name form : ";
const String typeFormS="Type form :   ";
const String spiecalTypeS="Speial type : ";
const String questionS="question  :    ";
const String addNewQuestionS=" Add Questions by click here ";
const String addQuestion="Add question ";
const String add="Add";
const String cancel="cancel";
const String editFormS="Edit Form";
const String edit="Edit";