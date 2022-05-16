import 'package:mylastwords/models/gallery.dart';

import 'models/alarm_info.dart';
import 'models/note.dart';

//Sample alarm data
List<AlarmInfo> alarms = [
  AlarmInfo(
    alarmDateTime: DateTime.now().add(Duration(hours: 1)),
    title: 'Office',
    id: "123123awd",
    alarmOnOff: "true",
  ),
  AlarmInfo(
    alarmDateTime: DateTime.now().add(Duration(hours: 2)),
    title: 'Sport',
    id: "awdawdawd",
    alarmOnOff: "true",
  ),
];

//Sample note data
List<Note> sampleNotesData = [
  Note(
    id: 12345,
    userId: 54321,
    title: 'sampleTitle1',
    body:
        'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.',
    dateTime: DateTime.now().add(Duration(hours: 1)),
  ),
  Note(
    id: 6789,
    userId: 0987,
    title: 'sampleTitle2',
    body:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.",
    dateTime: DateTime.now().add(Duration(hours: 1)),
  ),
];

//Sample note data
List<Gallery> sampleGalleryData = [
  Gallery(
    id: 1,
    userId: 5,
    imageUrl: 'https://picsum.photos/id/1/200/300',    
  ),
  Gallery(
    id: 2,
    userId: 5,
    imageUrl: 'https://picsum.photos/id/2/200/300',    
  ),
  Gallery(
    id: 3,
    userId: 5,
    imageUrl: 'https://picsum.photos/id/3/200/300',    
  ),
  Gallery(
    id: 4,
    userId: 5,
   imageUrl: 'https://picsum.photos/id/4/200/300', 
  ),
  Gallery(
    id: 5,
    userId: 5,
    imageUrl: 'https://picsum.photos/id/5/200/300',    
  ),
  Gallery(
    id: 6,
    userId: 5,
    imageUrl: 'https://picsum.photos/id/6/200/300',    
  ),
  Gallery(
    id: 7,
    userId: 5,
    imageUrl: 'https://picsum.photos/id/7/200/300',   
  ),
  Gallery(
    id: 8,
    userId: 5,
   imageUrl: 'https://picsum.photos/id/8/200/300', 
  ),
  Gallery(
    id: 9,
    userId: 5,
    imageUrl: 'https://picsum.photos/id/9/200/300', 
  ),
  Gallery(
    id: 10,
    userId: 5,
  imageUrl: 'https://picsum.photos/id/11/200/300',   
  ),
  Gallery(
    id: 11,
    userId: 5,
    imageUrl: 'https://picsum.photos/id/12/200/300',    
  ),
  Gallery(
    id: 12,
    userId: 5,
  imageUrl: 'https://picsum.photos/id/13/200/300', 
  ),
  Gallery(
    id: 13,
    userId: 5,
    imageUrl: 'https://picsum.photos/id/14/200/300',  
  ),
  Gallery(
    id: 14,
    userId: 5,
   imageUrl: 'https://picsum.photos/id/15/200/300',    
  ),
  Gallery(
    id: 15,
    userId: 5,
   imageUrl: 'https://picsum.photos/id/16/200/300',    
  ),
  Gallery(
    id: 16,
    userId: 5,
    imageUrl: 'https://picsum.photos/id/17/200/300',   
  ),
  Gallery(
    id: 17,
    userId: 5,
imageUrl: 'https://picsum.photos/id/18/200/300',   
  ),
  Gallery(
    id: 18,
    userId: 5,
imageUrl: 'https://picsum.photos/id/19/200/300',    
  ),
];
