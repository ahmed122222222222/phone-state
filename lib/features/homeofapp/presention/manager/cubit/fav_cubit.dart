import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:contacts_service/contacts_service.dart' as contacts_service;
import 'package:silent/constant.dart';
import 'package:silent/features/homeofapp/presention/view/wideget/fav.dart';

import '../../../../../main.dart';
import '../../../data/model/contactlistmodel.dart';
import '../../../data/model/cotactmodel.dart';
import '../../../data/model/repo.dart';
part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(FavInitial());
 List<ContactsList> contacts=[];
 Future<void> loadContactsFromHive() async {
  try {
    emit(FavLoad());
    final contactsBox = await Hive.openBox<ContactsList>(box);
  
    final contactsList = contactsBox.values.toList();
   contacts=contactsList;
     
emit(FavSucess(contact: contactsList));
    print("00000${contactsList.length}");

    

  } catch (e) {
    // Handle any errors that might occur when loading data from Hive
    print("Error loading data from Hive: $e");
     }   
}



   
}


