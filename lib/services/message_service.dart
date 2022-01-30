// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shamo_front_end/models/message_model.dart';
import 'package:shamo_front_end/models/product_model.dart';
import 'package:shamo_front_end/models/user_model.dart';

class MessageService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<MessageModel>> getMessageByUserId({required int userId}) {
    try {
      return firestore
          .collection('message')
          .where('userId', isEqualTo: userId)
          .snapshots()
          .map((QuerySnapshot list) {
        var result = list.docs.map<MessageModel>(
          (DocumentSnapshot message) {
            print(message.data());

            return MessageModel.fromJson(
                message.data() as Map<String, dynamic>);
          },
        ).toList();

        result.sort(
          (MessageModel a, MessageModel b) =>
              a.createdAt!.compareTo(b.createdAt!),
        );

        return result;
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addMessage({
    required UserModel user,
    required bool isFromUser,
    required String message,
    required ProductModel product,
  }) async {
    try {
      firestore.collection('message').add({
        'userId': user.id,
        'userName': user.username,
        'userImage': user.profilePhotoUrl,
        'isFromUser': isFromUser,
        'message': message,
        'product': product is UninitializedProductModel ? {} : product.toJson(),
        'createdAt': DateTime.now().toString(),
        'updatedAt': DateTime.now().toString(),
      }).then(
        (value) => print('Pesan Berhasil Dikirim'),
      );
    } catch (e) {
      throw Exception('Pesan Gagal Dikirim');
    }
  }
}
