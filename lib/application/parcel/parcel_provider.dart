import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/auth/model/area_model.dart';
import '../../domain/parcel/create_parcel_body.dart';
import '../../domain/parcel/parcel_category_model_response.dart';
import '../../domain/parcel/weight_model_response.dart';
import '../../infrastructure/parcel_repo.dart';
import '../global.dart';
import 'parcel_state.dart';

final parcelProvider =
    StateNotifierProvider<ParcelNotifier, ParcelState>((ref) {
  return ParcelNotifier(ref, ParcelRepo());
}, name: "parcelProvider");

class ParcelNotifier extends StateNotifier<ParcelState> {
  final Ref ref;
  final ParcelRepo repo;
  ParcelNotifier(this.ref, this.repo) : super(ParcelState.init());

  Future<List<AreaModel>> getDistrict() async {
    final data = await repo.allDistrict();

    return data.fold(
      (l) {
        showErrorToast(l.error.message);
        return [];
      },
      (r) => (r.data),
    );
  }

  Future<List<AreaModel>> getArea(String id) async {
    final data = await repo.allAreaByDistrict(id);

    return data.fold(
      (l) {
        showErrorToast(l.error.message);
        return [];
      },
      (r) => (r.data),
    );
  }

  Future<List<WeightModel>> getWeight() async {
    final data = await repo.getWeight();

    return data.fold(
      (l) {
        showErrorToast(l.error.message);
        return [];
      },
      (r) => (r.data),
    );
  }

  Future<List<ParcelCategoryModel>> getParcelCategory() async {
    final data = await repo.getParcelCategory();

    return data.fold(
      (l) {
        showErrorToast(l.error.message);
        return [];
      },
      (r) => (r.data),
    );
  }

  Future<bool> createParcel(CreateParcelBody body) async {
    bool success = false;
    state = state.copyWith(loading: true);

    final result = await repo.createParcel(body);

    result.fold((l) {
      showErrorToast(l.error.message);
      state = state.copyWith(loading: false);
    }, (r) {
      success = r.success;
      state = state.copyWith(loading: false);
    });

    return success;
  }
}
