import 'package:flutter_game/providers/provider.dart';
import 'package:flutter_game/screens/home/widgets/header.dart';
import 'package:flutter_game/dialogs/level_dialog.dart';
import 'package:flutter_game/screens/splash/widgets/logo.dart';
import 'package:flutter_game/dialogs/restart_dialog.dart';
import 'package:flutter_game/screens/home/widgets/table.dart';
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
            if (context.read<CountTimeProvider>().t != null)
              context.read<CountTimeProvider>().clear();
            context.read<CountTimeProvider>().countTime();
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                  splashRadius: 20,
                  icon: Icon(Icons.settings, color: Colors.deepPurple),
                  onPressed: () {
                    context.read<CountTimeProvider>().stop();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return LevelDialogBox();
                      },
                    ).then((value) {
                      context.read<CountTimeProvider>().countTime();
                    });
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
                    onPressed: () async {
                      if (!context.read<MainProvider>().showResultTrue) {
                        context.read<CountTimeProvider>().stop();
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return RestartDialog();
                          },
                        ).then((value) {
                          context.read<CountTimeProvider>().countTime();
                        });
                      } else {
                        context.read<CountTimeProvider>().cancel();
                        await context.read<MainProvider>().reset();
                        context.read<CountTimeProvider>().countTime();
                      }
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
                  Expanded(
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 400),
                      child: TableShow(),
                    ),
                  ),
                ],
              ),
            );
          }

          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.purpleAccent,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Loading',
                    style: TextStyle(
                      color: Colors.deepPurple[900],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
