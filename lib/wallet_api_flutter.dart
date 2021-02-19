library wallet_api_flutter;

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:network_flutter/network_flutter.dart';
import 'package:utils_flutter/utils_flutter.dart';
import 'package:wallet_sdk_flutter/wallet_sdk_flutter.dart';

part 'models/broadcast_info.entity.dart';
part 'models/coin_address.entity.dart';
part 'models/coin_balance.entity.dart';
part 'models/coin_info.entity.dart';
part 'models/wallet.config.dart';
part 'models/wallet.entity.dart';
part 'models/wallet.private.dart';
part 'models/wallet_path_config.dart';
part 'services/wallet_api.dart';
part 'services/wallet_repository.dart';
part 'store/wallet_actions.broadcast.dart';
part 'store/wallet_actions.create.dart';
part 'store/wallet_actions.dart';
part 'store/wallet_actions.management.dart';
part 'store/wallet_actions.wallet.dart';
part 'store/wallet_actions.withdraw.before.dart';
part 'store/wallet_actions.withdraw.submit.dart';
part 'store/wallet_errors.dart';
part 'store/wallet_state.dart';
part 'wallet_api_flutter.g.dart';

const int kHiveTypeWallet = 10;
const int kHiveTypeWalletType = 11;
const int kHiveTypeWalletStatus = 15;
const int kHiveTypeCoinInfo = 12;
const int kHiveTypeCoinAddress = 13;
const int kHiveTypeCoinBalance = 14;
const int kHiveTypeBroadcastTxType = 50;
const int kHiveTypeBroadcastTxInfo = 51;

Future<void> moduleWalletInitHive() async {
  Hive.registerAdapter(WalletAdapter());
  Hive.registerAdapter(WalletTypeAdapter());
  Hive.registerAdapter(WalletStatusAdapter());
  Hive.registerAdapter(CoinInfoAdapter());
  Hive.registerAdapter(CoinAddressAdapter());
  Hive.registerAdapter(CoinBalanceAdapter());
  Hive.registerAdapter(BroadcastTxTypeAdapter());
  Hive.registerAdapter(BroadcastTxInfoAdapter());

  await WalletRepository().initializeCache();
}

Future<void> moduleWalletInitGetIt() async {
  //
}


