import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/messaging/domain/entites/contact_entity.dart';
import 'package:papyros/features/messaging/domain/use_cases/get_contact_use_case.dart';

part 'get_contacts_state.dart';

class GetContactsCubit extends Cubit<GetContactsState> {
  final GetContactUseCase getContactUseCase;
  GetContactsCubit(this.getContactUseCase) : super(GetContactsInitial());
  Future<Either<Failure, List<ContactEntity>>> getContacts() async {
    emit(GetContactsLoading());
    final result = await getContactUseCase.call();
    return result.fold(
      (failure) {
        emit(GetContactsFaliure(failure.errMessage));
        return Left(failure);
      },
      (contacts) {
        emit(GetContactsSuccess(contacts));
        return Right(contacts);
      },
    );
  }
}
