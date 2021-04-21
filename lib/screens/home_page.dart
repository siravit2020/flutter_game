import 'package:flutter_game/provider.dart';
import 'package:flutter_game/widgets/header.dart';
import 'package:flutter_game/widgets/level_dialog.dart';
import 'package:flutter_game/screens/splash/widgets/logo.dart';
import 'package:flutter_game/widgets/restart_dialog.dart';
import 'package:flutter_game/widgets/table.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureProvider<bool>(
        initialData: false,
        create: (context) => context.read<MainProvider>().initial(),
        builder: (context, wid) {
          print('rebuild');
          final value = context.watch<bool>();
          if (value) {
            context.read<CountTimeProvider>().countTime();
            return
            Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                  splashRadius: 20,
                  icon: Icon(Icons.settings, color: Colors.deepPurple),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return LevelDialogBox();
                      },
                    );
                  },
                ),
                actions: [
                  IconButton(
                    splashRadius: 20,
                    icon: Icon(
                      Icons.restore,
                      color: Colors.deepPurple,
                      size: 24,
                    ),
                    onPressed: () {
                      context.read<CountTimeProvider>().stop();
                      if (!context.read<MainProvider>().checkRestat())
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return RestartDialog();
                          },
                        ).then((value) {
                          context.read<CountTimeProvider>().countTime();
                        });
                    },
                  )
                ],
                title: Logo(
                  textSize: 20,
                ),
              ),
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  Header(),
                  Container(
                    child: TableShow(),
                  ),
                ],
              ),
            );
          }
          return Center(
            child: Text('Loading'),
          );
        },
      ),
    );
  }
}
