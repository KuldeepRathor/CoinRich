import 'package:coinrich/model/model.dart';
import 'package:dio/dio.dart';


// class CoinRichApi{
//   String apikey = '27ab17d1-215f-49e5-9ca4-afd48810c149';
//   String url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?symbol=BTC,ETHLTC#';
// }

Future<Coin> fetchData() async {
  var dio = Dio();
  String apikey = '27ab17d1-215f-49e5-9ca4-afd48810c149';
  String url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?symbol=BTC,ETHLTC#';
  var response = await dio.get(url,
      options: Options(headers: {
        'X-CMC_PRO_API_KEY': apikey
      }));
  print(response.statusCode);
  print(response.data.toString());
  var res = Coin.fromJson(response.data);
  return Coin.fromJson(response.data);
}








// class Coin{
//   String name;
//   // String symbol;
//   String price;
//   String rank;
//   // String change;
//   // String volume;
//   // String marketcap;
//   // String circulatingSupply;
//   // String totalSupply;
//   // String maxSupply;
//   // String lastUpdated;

//   Coin({
//     required this.name,
//     // this.symbol,
//     required this.price,
//     required this.rank,
//     // this.change,
//     // this.volume,
//     // this.marketcap,
//     // this.circulatingSupply,
//     // this.totalSupply,
//     // this.maxSupply,
//     // this.lastUpdated,
//   });
//   factory Coin.fromJson(Map<String, dynamic>json){
//     return Coin(
//       name: json['name'],
//       // symbol: json['symbol'],
//       price: json['price'],
//       rank: json['rank'],
//       // change: json['change'],
//       // volume: json['volume'],
//       // marketcap: json['marketcap'],
//       // circulatingSupply: json['circulatingSupply'],
//       // totalSupply: json['totalSupply'],
//       // maxSupply: json['maxSupply'],
//       // lastUpdated: json['lastUpdated'],
//     );
//   }
// }








// class CoinApiServices{
//   String apikey = '27ab17d1-215f-49e5-9ca4-afd48810c149';
//   String url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?symbol=BTC,ETHLTC#';

//   Future<dynamic> getCoinData() async{
//     var dio = Dio();
//     var response = await dio.get(url, options: Options(headers: {'X-CMC_PRO_API_KEY': apikey}));
//     return response.statusCode;

//   }

//   CoinApiServices(){
//     getCoinData();
//   }
// }
