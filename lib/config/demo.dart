import '../config/Palettes.dart';
import 'package:flutter/material.dart';

List productList = [
  {"name": "Amrit Sweets", "category": "North Indian,South Indian", "price": "700", "discount_price": "500", "image": "https://mertimonial.flutter-dev.in.net/public/assets/img/neartake_images/restaurant1.jpg"},
  {"name": "Burger King", "category": "Burger,American", "price": "700", "discount_price": "500", "image": "https://mertimonial.flutter-dev.in.net/public/assets/img/neartake_images/restaurant2.jpg"},
  {"name": "Amrit Sweets", "category": "North Indian,South Indian", "price": "700", "discount_price": "500", "image": "https://mertimonial.flutter-dev.in.net/public/assets/img/neartake_images/restaurant2.jpg"},
  {"name": "Amrit Sweets", "category": "North Indian,South Indian", "price": "700", "discount_price": "500", "image": "https://mertimonial.flutter-dev.in.net/public/assets/img/neartake_images/restaurant1.jpg"},
  {"name": "Amrit Sweets", "category": "North Indian,South Indian", "price": "700", "discount_price": "500", "image": "https://mertimonial.flutter-dev.in.net/public/assets/img/neartake_images/restaurant1.jpg"},
  {"name": "Amrit Sweets", "category": "North Indian,South Indian", "price": "700", "discount_price": "500", "image": "https://mertimonial.flutter-dev.in.net/public/assets/img/neartake_images/restaurant1.jpg"},
  {"name": "Amrit Sweets", "category": "North Indian,South Indian", "price": "700", "discount_price": "500", "image": "https://mertimonial.flutter-dev.in.net/public/assets/img/neartake_images/restaurant1.jpg"},
  {"name": "Amrit Sweets", "category": "North Indian,South Indian", "price": "700", "discount_price": "500", "image": "https://mertimonial.flutter-dev.in.net/public/assets/img/neartake_images/restaurant1.jpg"},
  {"name": "Amrit Sweets", "category": "North Indian,South Indian", "price": "700", "discount_price": "500", "image": "https://mertimonial.flutter-dev.in.net/public/assets/img/neartake_images/restaurant1.jpg"},
  {"name": "Amrit Sweets", "category": "North Indian,South Indian", "price": "700", "discount_price": "500", "image": "https://mertimonial.flutter-dev.in.net/public/assets/img/neartake_images/restaurant1.jpg"},
  {"name": "Amrit Sweets", "category": "North Indian,South Indian", "price": "700", "discount_price": "500", "image": "https://mertimonial.flutter-dev.in.net/public/assets/img/neartake_images/restaurant1.jpg"},
  {"name": "Amrit Sweets", "category": "North Indian,South Indian", "price": "700", "discount_price": "500", "image": "https://mertimonial.flutter-dev.in.net/public/assets/img/neartake_images/restaurant1.jpg"},
  {"name": "Amrit Sweets", "category": "North Indian,South Indian", "price": "700", "discount_price": "500", "image": "https://mertimonial.flutter-dev.in.net/public/assets/img/neartake_images/restaurant1.jpg"},
  {"name": "Amrit Sweets", "category": "North Indian,South Indian", "price": "700", "discount_price": "500", "image": "https://mertimonial.flutter-dev.in.net/public/assets/img/neartake_images/restaurant1.jpg"},
  {"name": "Amrit Sweets", "category": "North Indian,South Indian", "price": "700", "discount_price": "500", "image": "https://mertimonial.flutter-dev.in.net/public/assets/img/neartake_images/restaurant1.jpg"},
];

const List drawerList = [
  {"id": 1, "name": "My Orders", "icon": Icon(Icons.data_saver_off_rounded)},
  {"id": 2, "name": "My Address", "icon": Icon(Icons.location_on)},
  {"id": 3, "name": "About Us", "icon": Icon(Icons.add_business_outlined)},
  {"id": 4, "name": "Terms & Conditions", "icon": Icon(Icons.add_moderator_rounded)},
  {"id": 5, "name": "Privacy Policy", "icon": Icon(Icons.privacy_tip)},
  {"id": 6, "name": "Return Policy", "icon": Icon(Icons.local_police_rounded)},
  {"id": 7, "name": "Help Center", "icon": Icon(Icons.help_outline_rounded)},
  {"id": 8, "name": "Logout", "icon": Icon(Icons.power_settings_new, color: Palettes.red)},
];

const List orderList = [
  {"id": "#0001", "time": "2020-01-01T00:00:00", "address": "#123,Phase-5,Mohali,India,176087", "price": "500", "item": "1", "status": "pending"},
  {"id": "#0002", "time": "2020-01-01T00:00:00", "address": "#123,Phase-5,Mohali,India,176087", "price": "400", "item": "1", "status": "confirm"},
  {"id": "#0003", "time": "2020-01-01T00:00:00", "address": "#123,Phase-5,Mohali,India,176087", "price": "200", "item": "1", "status": "cancel"},
  {"id": "#0004", "time": "2020-01-01T00:00:00", "address": "#123,Phase-5,Mohali,India,176087", "price": "700", "item": "1", "status": "out_of_delivery"},
  {"id": "#0005", "time": "2020-01-01T00:00:00", "address": "#123,Phase-5,Mohali,India,176087", "price": "700", "item": "1", "status": "completed"},
  {"id": "#0006", "time": "2020-01-01T00:00:00", "address": "#123,Phase-5,Mohali,India,176087", "price": "500", "item": "1", "status": "pending"},
];

const List bannerList = [
  {"id": "1", "url": "https://mertimonial.flutter-dev.in.net/public/assets/img/neartake_images/banner1.png"},
  {"id": "2", "url": "https://mertimonial.flutter-dev.in.net/public/assets/img/neartake_images/banner2.png"},
  // {"id": "3", "url": "https://firebasestorage.googleapis.com/v0/b/sample-ba5fa.appspot.com/o/home%2Fslider_3.png?alt=media&token=f6035e3e-de66-4643-a576-06ce5d646f72"},
];
const List categoryList = [
  {"name": "Food", "image": "https://mertimonial.flutter-dev.in.net/public/assets/img/neartake_images/category1.png"},
  {"name": "Grocery", "image": "https://mertimonial.flutter-dev.in.net/public/assets/img/neartake_images/category2.png"},
  {"name": "Fruit & Vegetable", "image": "https://mertimonial.flutter-dev.in.net/public/assets/img/neartake_images/category3.png"},
  {"name": "Other", "image": "https://mertimonial.flutter-dev.in.net/public/assets/img/neartake_images/category3.png"}
];
