import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NetworkScreen extends StatefulWidget {
  const NetworkScreen({super.key});

  @override
  State<NetworkScreen> createState() => _NetworkScreenState();
}

class _NetworkScreenState extends State<NetworkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Network Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const SecondScreen(),
            ),
          ),
          child: const Text(
            "Go to screen",
          ),
        ),
      ),
    );
  }
}

class CountryData {
  final String country;
  final String region;

  CountryData({
    required this.country,
    required this.region,
  });

  factory CountryData.fromJson(Map<String, dynamic> json) {
    return CountryData(
      country: json['country'],
      region: json['region'],
    );
  }
}

class CountryDataResponse {
  final Map<String, CountryData> data;

  CountryDataResponse({
    required this.data,
  });

  factory CountryDataResponse.fromJson(Map<String, dynamic> json) {
    Map<String, CountryData> countries = {};

    json.forEach((key, value) {
      countries[key] = CountryData.fromJson(value);
    });
    return CountryDataResponse(data: countries);
  }
}

Future<CountryDataResponse> getCountries() async {
  final dio = Dio();
  await Future.delayed(const Duration(seconds: 3));
  final request = await dio.get('https://api.first.org/data/v1/countries');
  return CountryDataResponse.fromJson(request.data['data']);
}

class SecondScreen extends ConsumerStatefulWidget {
  const SecondScreen({super.key});

  @override
  ConsumerState<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends ConsumerState<SecondScreen> {
  late AutoDisposeFutureProvider<CountryDataResponse> countryProvider;
  @override
  void initState() {
    super.initState();

    countryProvider = FutureProvider.autoDispose((ref) => getCountries());
  }

  @override
  Widget build(BuildContext context) {
    final country = ref.watch(countryProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries'),
      ),
      body: Center(
        child: country.when(
          skipLoadingOnRefresh: false,
          data: (data) => ListView.builder(
            itemCount: data.data.length,
            itemBuilder: (context, index) {
              var list = data.data.values.toList()[index];
              return ListTile(
                title: Text('Country: ${list.country}'),
                subtitle: Text('Region: ${list.region}'),
              );
            },
          ),
          error: (error, trace) {
            return ElevatedButton(
              onPressed: () => ref.invalidate(countryProvider),
              child: const Text('Retry'),
            );
          },
          loading: () => const CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}
