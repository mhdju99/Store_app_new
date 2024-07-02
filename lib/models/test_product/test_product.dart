import 'datum.dart';
import 'pagenation.dart';

class TestProduct {
	int? result;
	Pagenation? pagenation;
	List<Datum>? data;

	TestProduct({this.result, this.pagenation, this.data});

	factory TestProduct.fromJson(Map<String, dynamic> json) => TestProduct(
				result: json['result'] as int?,
				pagenation: json['pagenation'] == null
						? null
						: Pagenation.fromJson(json['pagenation'] as Map<String, dynamic>),
				data: (json['data'] as List<dynamic>?)
						?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'result': result,
				'pagenation': pagenation?.toJson(),
				'data': data?.map((e) => e.toJson()).toList(),
			};
}
