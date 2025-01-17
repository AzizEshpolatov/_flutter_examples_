import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_examples/repo/user_repo.dart';
import '../../bloc/user_bloc.dart';
import '../../bloc/user_event.dart';
import '../../bloc/user_state.dart';

/// TODO : ASLIDA STATELESS ISHLATISHIM KERAK EDI, LIFECYCLE TUSHUNISH UCHUN STATEFUL ISHLATDIM
class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  // todo [1] -> createState()
  /// createState -> birinchi ishga tushadigan stateful lifecycle bolib
  /// stateFul yaratilib u bilan bogliq bolgan state obyekti yaratilganda
  /// chaqiriladi
  /// bu method state obyektini yaratadi, va StatefulWidget uchun bir marta
  /// chaqiriladi

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  // todo [2] -> initState()
  // state obyekti yaratilib widget tree-ga qoshilganda chaqiriladi.
  // initState metodi State obyektining boshlang‘ich holatini sozlash uchun javobgar
  // Bu yerda siz API chaqiruvlari, AnimationController yaratish yoki boshqa
  // dastlabki ishlarni amalga oshirasiz. initState faqat bir marta,
  // createState-dan keyin chaqiriladi.
  @override
  void initState() {
    super.initState();
    debugPrint('initState: Boshlang‘ich sozlash.');
  }

  // todo [3] -> didChangeDependencies()
  // didChangeDependencies — bu State obyektining bir qismi bo'lib, widgetning
  // bog'liq ma'lumotlari o'zgarganda chaqiriladi. Bu ma'lumotlar odatda
  // InheritedWidget yoki BuildContext orqali taqdim etiladi.
  // Masalan, Theme, MediaQuery, yoki boshqa InheritedWidget ma'lumotlari
  // yangilanganda chaqiriladi
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final screenWidth = MediaQuery.of(context).size.width;
    debugPrint('Ekran kengligi: $screenWidth');
  }

  // todo [4] -> build()
  // build metodi widgetning foydalanuvchi interfeysini chizish uchun ishlatiladi.
  // Bu widget tree-ning UI qismini yaratadi. Har safar setState chaqirilganda
  // yoki boshqa holatlar o‘zgarganda, build metodi qayta chaqiriladi.

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(UserRepository())..add(FetchUsers()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Users Page')),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UserLoaded) {
              return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  final user = state.users[index];
                  return ListTile(
                    leading:
                        CircleAvatar(backgroundImage: NetworkImage(user.image)),
                    title: Text('${user.firstName} ${user.lastName}'),
                    subtitle: Text(user.email),
                  );
                },
              );
            } else if (state is UserError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text('No data available'));
          },
        ),
      ),
    );
  }

  // todo [5] -> didUpdateWidget()
  // didUpdateWidget metodi eski widget va yangi widgetni solishtirish uchun i
  // shlatiladi. Agar ota widget ma'lumotlarini yangilasa, ushbu metod chaqiriladi.
  // Bu orqali eski va yangi qiymatlar o‘rtasidagi farqni aniqlashingiz mumkin.
  @override
  void didUpdateWidget(covariant dynamic oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint('didUpdateWidget: Widget yangilandi.');
  }

  // todo [6] -> deactivate()
  // bu method asosan screen-dan screen-ga o'tganimizda ishga tushadi yani
  // widgetning widget tree-dan olib tashlanganda chaqiriladi
  @override
  void deactivate() {
    super.deactivate();
    debugPrint('deactivate: Widget daraxtidan chiqarildi.');
  }

  // todo [7] -> dispose()
  // dispose metodi widget to'liq o'chirilganda chaqiriladi. Bunda resurslarni,
  // masalan, Controller, Stream, yoki Listenerlarni tozalash kerak bo'ladi.
  @override
  void dispose() {
    debugPrint('dispose: Resurslar tozalanmoqda.');
    super.dispose();
  }
}
