import 'dart:ui';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';

class UploadTaskListTile extends StatelessWidget {
  const UploadTaskListTile({Key key, this.task, this.onDismissed, this.onDownload}):super(key: key);
  final StorageUploadTask task;
  final VoidCallback onDismissed;
  final VoidCallback onDownload;

  String get status{
    String result;
    if(task.isComplete){
      if(task.isSuccessful){
        result = "Complete";
      }else if(task.isCanceled){
        result = "Canceled";
      }else{
        result = "Erro: ${task.lastSnapshot.error}";
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<StorageTaskEvent>(
      stream: task.events,
      builder: (BuildContext context, AsyncSnapshot<StorageTaskEvent> asyncSnapshot){
        Widget subtitle;
        if(asyncSnapshot.hasData){
          final StorageTaskEvent event = asyncSnapshot.data;
          final StorageTaskSnapshot snapshot = event.snapshot;
          subtitle =  Text("$status");
        }
        return Dismissible(
          key: Key(task.hashCode.toString()),
          onDismissed: (_)=>onDismissed(),
          child: ListTile(
            title: Text("Livro: ")
          ),
        );
      },
    );
  }
}