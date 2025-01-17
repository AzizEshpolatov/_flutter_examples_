/*
* # StatelessWidget va StatefulWidget

Flutterda **StatelessWidget** va **StatefulWidget** foydalanuvchi interfeyslarini
yaratish uchun asosiy qurilish bloklari hisoblanadi. Ularning farqlarini tushunish
va qachon ishlatish kerakligini bilish samarali dastur ishlab chiqish uchun muhimdir.
---

## **1. StatelessWidget**
**StatelessWidget** o'zgarmas (immutable) hisoblanadi. U yaratib bo'lingandan so'ng
o'z holatini yoki ko'rinishini o'zgartira olmaydi. Ushbu widgetlar dinamik ma'lumotlar
yoki foydalanuvchi bilan o'zaro aloqa talab qilmaydigan UI elementlari uchun idealdir.

### **Asosiy Xususiyatlari:**
- O'zgarmas: Yaratilgandan so'ng o'zgartirib bo'lmaydi.
- Yengil va samarali.
- Statik UI elementlari uchun ishlatiladi.

### **Misollar:**
- Text
- Icon
- ElevatedButton (agar uning xatti-harakati o'zgarmasa)

### **Kod Namuna:**
```dart
import 'package:flutter/material.dart';

class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stateless Widget')),
      body: Center(
        child: Text('Men Stateless Widgetman!'),
      ),
    );
  }
}
```

---

## **2. StatefulWidget**
**StatefulWidget** o'z holatini o'zgartirish qobiliyatiga ega. Bu foydalanuvchi bilan
o'zaro aloqada bo'lgan yoki boshqa omillarga bog'liq ravishda dinamik ravishda
yangilanishi kerak bo'lgan UI elementlari uchun ishlatiladi.

### **Asosiy Xususiyatlari:**
- O'zgaruvchan: Hayoti davomida holatini o'zgartirishi mumkin.
- `State` obyektini o'z ichiga oladi, u holatni boshqaradi.
- Interaktiv yoki dinamik UI elementlari uchun ishlatiladi.

### **Misollar:**
- Checkbox
- TextField
- Animatsion widgetlar

### **Kod Namuna:**
```dart
import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stateful Widget')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Tugma shu marta bosildi:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Qo‘shish',
        child: Icon(Icons.add),
      ),
    );
  }
}
```

---

## **3. StatelessWidget va StatefulWidget o'rtasidagi farqlar**

| **Jihat**              | **StatelessWidget**                         | **StatefulWidget**                         |
|------------------------|---------------------------------------------|--------------------------------------------|
| **O'zgarmaslik**       | O'zgarmas                                   | O'zgaruvchan                                 |
| **Holatni boshqarish** | Holatni saqlay olmaydi                      | Holatni saqlaydi va boshqaradi              |
| **Qayta qurish**       | Faqat setState chaqirilganda qayta quriladi |
| **Foydalanish holati** | Statik UI elementlari                       | Interaktiv yoki dinamik UI elementlari      |
| **Samaradorlik**       | Yengil, oddiy UI uchun yaxshiroq            | Holat boshqaruvi tufayli biroz og'irroq     |

---

## **4. Qachon qaysi birini ishlatish kerak?**

### **StatelessWidget dan foydalaning, agar:**
- UI statik va foydalanuvchi bilan o'zaro aloqa yoki tashqi ma'lumotlarga bog'liq bo'lmasa.
- Oddiy va samarali UI komponent yaratmoqchi bo'lsangiz.

### **StatefulWidget dan foydalaning, agar:**
- UI dinamik ma'lumotlarga yoki foydalanuvchi bilan o'zaro aloqaga bog'liq bo'lsa.
- Holat o'zgarishiga asoslangan yangilanishlar kerak bo'lsa (masalan, hisoblagich, forma kiritish).

---

## **5. Eng yaxshi amaliyotlar**
1. **StatefulWidget dan minimal foydalaning**: Oddiy UI komponentlar uchun
StatelessWidget'ni tanlang.
2. **Holat boshqaruvini delegatsiya qiling**: Katta loyihalarda Provider, Bloc,
 yoki Riverpod kabi holat boshqarish echimlarini qo'llang.
3. **Widgetlarni kichik bo'laklarga bo'ling**: Katta widgetlarni kichik
StatelessWidget yoki StatefulWidget komponentlariga bo'lish kodni o'qilishi osonroq
qiladi.

---

StatelessWidget va StatefulWidget o'rtasidagi farqlarni tushunish samarali va
kengaytiriladigan Flutter dasturlarini yozish uchun muhimdir. Ulardan to'g'ri foydalanib,
 samarali va interaktiv UI yaratishingiz mumkin!

* */

