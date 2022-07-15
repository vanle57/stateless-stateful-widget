# StatelessWidget vs StatefulWidget

## 1. Intro

Xin chào các bạn, chắc cũng cả tháng rồi mình chưa viết bài mới. Vậy nên hôm nay mình sẽ "xuất bản" một chủ đề vô cùng cần thiết cho những ai muốn lấn sân sang flutter. Đó là StatelessWidget và StatefulWidget.

## 2. Mở đầu

Khi tiếp xúc với Flutter, có lẽ các bạn đều đã quen hoặc nếu không quen thì cũng đã từng nghe câu “Everything is a widget!” – có nghĩa là tất cả mọi thứ đều là widget. Text là một widget, Button là một Widget, các Animation cũng là Widget, thậm chí bản thân app cũng là một Widget. Nghe nhiều là vậy nhưng thực chất các widget này lại được chia thành hai nhóm chính là StalessWidget và StatefulWidget.

Mình cũng khá chắc là trong số những bạn đang đọc bài viết này cũng có một số bạn đã biết về hai loại này nhưng để hiểu về nó thì còn khá mơ hồ. Vậy nên bài viết này mình sẽ cố gắng trình bày về chúng một cách đơn giản nhất có thể để các bạn nắm bắt được.

## 3. Khái niệm State

State trong tiếng Anh có nghĩa là trạng thái. Trong thế giới của mobile dev, nó thể hiện các trạng thái của ứng dụng. Mình ví dụ đơn giản nhé. Khi các bạn check / uncheck check box thì đó là hai trạng thái của check box. Ví dụ rõ ràng hơn nữa là màn hình đăng nhập thể hiện ba trạng thái nhập email / mật khẩu sai định dạng (validate error), đăng nhập thành công hoặc đăng nhập fail (api error).

> Nếu các bạn đã từng biết về lập trình mobile với các ngôn ngữ truyền thống như Swift thì bây giờ chính là lúc chúng ta thay đổi tư duy!

Flutter chuyển đổi cách lập trình truyền thống từ lập trình mệnh lệnh (imperative) sang lập trình khai báo (declarative). Điều này có nghĩa là Flutter UI phản ánh các trạng thái trong app:

![1](https://github.com/vanle57/stateless-stateful-widget/blob/main/images/1.png)

Trong định nghĩa của trang Flutter ở [đây](https://api.flutter.dev/flutter/widgets/State-class.html) có nhắc đến, State có thể được đọc một cách đồng bộ khi widget được build và có thể thay đổi trong suốt vòng đời của widget đó.

Vậy thì Stateless Widget và Stateful Widget là gì? Chúng khác nhau ra sao? Chúng ta
cùng tìm hiểu tiếp nhé!

## 4. StatelessWidget vs StatefulWidget

### 4.1. StatelessWidget

- Stateless widget là các widget có trạng thái không thể thay đổi sau khi chúng được build. Chúng chỉ đơn thuần nhận dữ liệu và hiển thị một cách thụ động. Nếu muốn render lại thì ta phải khởi tạo lại chúng.

- Một ví dụ về stateles widget là ***Text***. Nó chỉ đơn giản hiển thị các văn bản mà chúng
  ta truyền cho nó. Ví dụ khác là ***IconButton***. Nó chỉ khác Text ở phần là chúng ta có thể tương tác với button nhưng điều đó cũng không làm thay đổi bất cứ điều gì ở button.

- <u>Vòng đời</u>: Vì không thay đổi nên vòng đời của stateless widget khá đơn giản, chỉ xoay quanh hàm `build()`.  Câu hỏi được đặt ra ở đây là hàm `build()` của chúng sẽ được gọi khi nào? Mình có thể liệt kê ra những thời điểm như sau:
  
  - Lần đầu tiên widget được khởi tạo và chèn vào trong widget tree. Tìm hiểu thêm về widget tree tại [Flutter cơ bản: Widget Tree, Element Tree và Render Tree](https://200lab.io/blog/flutter-co-ban-widget-tree-element-tree-render-tree/).
  
  - Khi widget cha thay đổi cấu hình thì cũng sẽ kích hoạt hàm `build()` của các widget con và khiến chúng được render lại.
  
  - Khi `InheritedWidget` chúng phụ thuộc vào thay đổi. Cái này nghe khá khó hiểu nhỉ? Mình sẽ có một bài viết giải thích cụ thể về InheritedWidget sau nhé!

### 4.2. StatefulWidget

- Stateful widget là các widget có thể thay đổi trạng thái. Khác với stateless widget, chúng ta không cần thiết phải khởi tạo lại stateful widget để thay đổi chúng mà chỉ cần thay đổi state của chúng và Flutter sẽ gọi hàm `build()` để render lại UI cho phù hợp với state đó.

- Nghe hơi mơ hồ phải không? Mình ví dụ như nút like của facebook. Khi user bấm like thì nó sẽ đổi thành màu xanh phải không? Và khi user click thêm một lần nữa thì nó chuyển lại màu xám. Đó chính xác là một stateful widget.

- <u>Vòng đời:</u> Vòng đời của Stateful widget thì khá phức tạp, các bạn hãy theo dõi hình sau đây nhé! 
  
  ![2](https://github.com/vanle57/stateless-stateful-widget/blob/main/images/2.png)

***Giải thích:*** 

- Trước khi đi vào giải thích trên từng con số ở ảnh thì mình muốn mọi người lưu ý một chút. Một statefut widget sẽ bao gồm 2 phần là 1 widget và 1 state object. Bản thân đối tượng StatefulWidget là bất biến (immutable) và lưu trữ trạng thái có thể thay đổi (mutable) của chúng trong State object.

- Trên hình mình chia ra làm 3 phần là: 
  
  - Time to trigger: thời điểm kích hoạt
  
  - StatefulWidget: phần widget mà mình nhắc đến của StatefulWidget
  
  - State object: phần trạng thái có thể thay đổi được của StatefulWidget

- Bây giờ cùng phân tích những con số trên hình nào!!!
  
  - (1): Thời điểm đầu tiên widget được khởi tạo và chèn vào trong widget tree.
  
  - (2) và (3): Sau khi gọi `constructor`, Flutter sẽ gọi hàm [createState()](https://api.flutter.dev/flutter/widgets/StatefulWidget/createState.html) để tạo ra đối tượng của State cho widget. Kể từ đó về sau, Flutter đa số chỉ làm việc State object mà thôi (vì đối tượng của StatefulWidget là bất biến, như mình đã nói ở trên).
  
  - (4): Trên State object, sau khi gọi hàm `createState()` thì hàm [initState()](https://api.flutter.dev/flutter/widgets/State/initState.html) sẽ được gọi. Và hàm này chỉ được gọi **chỉ một lần duy nhất** cho mỗi 1 đối tượng của State. Bạn có thể `override` phương thức này để khởi tạo các thuộc tính, khởi tạo dữ liệu, đăng ký Streams, ChangeNotifiers, vân vân và mây mây....
  
  - (5): Phương thức [didChangeDependencies()](https://docs.flutter.io/flutter/widgets/State/didChangeDependencies.html) được gọi ngay sau initState lần đầu tiên.
  
  - (6): Hàm [build()]((https://api.flutter.dev/flutter/widgets/State/build.html) được gọi để render UI. Vậy là hoàn thành các bước kể từ lần đầu tiên widget được khởi tạo. Sau đây sẽ là những bước thực hiện khi có bất kỳ sự thay đổi nào.
  
  - (7): Trường hợp InheritedWidget mà widget có dữ liệu phụ thuộc vào thay đổi thì sẽ kích hoạt hàm `didChangeDependencies()`, sau đó Flutter sẽ gọi  `build()` để render lại UI.
  
  - (8) và (9): Giả sử như user tác động lên UI để thay đổi state của widget (ví dụ như like / unlike) thì khi đó việc của các developer chúng ta sẽ là gọi hàm [setState()](https://api.flutter.dev/flutter/widgets/State/setState.html) để thay đổi trạng thái của object. Việc này sẽ giúp cho framework được thông báo về sự thay đổi này và sẽ gọi hàm `build()` để render lại UI tương ứng.
  
  - (10) và (11): Khi widget cha của nó build lại và yêu cầu các widget con build cập nhật lại, Flutter sẽ thực hiện việc gọi hàm [didUpdateWidget()](https://api.flutter.dev/flutter/widgets/State/didUpdateWidget.html) . Sau đó, hàm `build()` cũng sẽ được gọi.
  
  - (12): Hàm [dispose()](https://api.flutter.dev/flutter/widgets/State/dispose.html) được gọi khi state object bị xoá khỏi widget tree vĩnh viễn.
  
  > Túm lại, như bạn đã thấy ở trên hàm `build()` là cái hàm được gọi liên tục. Bởi vì sao? Bởi vì nó là nơi quyết định UI, nên khi có bất kỳ sự thay đổi cần thiết nào trên UI, nó sẽ được gọi lại để render tương ứng.

## 5. Cách làm việc với StatlessWidget và StatefulWidget

Ý tưởng của mình như sau:

Đầu tiên mình sẽ tạo một button là StalessWidget, sau đó convert button đó sang StatefulWidget. Mục đích của button này sẽ là like / unlike một cái gì đó giống như nút like trên facebook. Okay! Bắt tay vào thôi nào.

### 5.1. StatelessWidget

Các bạn tạo mới Flutter project và file `like_button.dart` nhé!

##### Bước 1: Tạo mới một StatelessWidget

Trên VS Code, để tạo mới một StalessWidget bạn chỉ cần gõ *stl* thì trình biên dịch sẽ đề xuất cho bạn

![3](https://github.com/vanle57/stateless-stateful-widget/blob/main/images/3.png)

Bạn đặt tên class là `LikeButton` và nhớ import  `package:flutter/material.dart` nhé!

```dart
import 'package:flutter/material.dart';

class LikeButton extends StatelessWidget {
  const LikeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          print('Liked');
        },
        iconSize: 20,
        icon: const Icon(Icons.thumb_up_off_alt));
  }
}
```

Action của mình hiện tại chỉ đơn giản là `print`. Vậy là xong phần `LikeButton`. Bạn tiếp tục vào file `main.dart` để sử dụng button này nhé!

##### Bước 2:  Sử dụng StatelessWidget đã tạo ở bước 1

Bạn hãy xoá phần class `MyHomePage` do framework cung cấp sẵn và tự tạo `MyHomePage` của mình. Vẫn là một StatelessWidget nhé!

```dart
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StatelessWidget Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            LikeButton(),
            Text('You have not like yet!'),
          ],
        ),
      ),
    );
  }
}
```

****Lưu ý nho nhỏ:*** Ở đây mình có thêm 1 `Text` để thông báo user đã like hay chưa nhé!

Rồi chúng ta cùng build và xem kết quả nhé!

##### Kết quả:

![4](https://github.com/vanle57/stateless-stateful-widget/blob/main/images/4.png)

Khi ấn nút like thì trên console sẽ log ra cho ta text *"Liked"*. 

### 5.2. StatefulWidget

Các bạn có thể dùng lại project trước đó hoặc tạo mới project tương tự như vậy.
![5](https://github.com/vanle57/stateless-stateful-widget/blob/main/images/5.png)

##### Bước 1: Tạo mới một StatefulWidget

Trên VS Code, để tạo mới một StalefulWidget bạn chỉ cần gõ *stf* thì trình biên dịch sẽ đề xuất cho bạn. Nếu bạn đang sử dụng project trước thì bạn có thể convert `LikeButton` sang StatefulWidget bằng cách di chuyển con trỏ về đầu dòng class LikeButton -> click vào bóng đèn màu vàng chọn *Convert to StatefulWidget*.

![6](https://github.com/vanle57/stateless-stateful-widget/blob/main/images/6.png)

Sau khi convert thì `LikeButton` đã trở thành như thế này:

```dart
class LikeButton extends StatefulWidget {
  const LikeButton({Key? key}) : super(key: key);

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          print('Liked');
        },
        iconSize: 50,
        icon: const Icon(Icons.thumb_up_off_alt));
  }
}
```

##### Bước 2: Xử lý State object

Để biết được user đã like hay chưa thì mình cần có một biến lưu lại trạng thái này. 

```dart
class _LikeButtonState extends State<LikeButton> {
  // 1
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            // 3
            isLiked = !isLiked;
          });
        },
        iconSize: 50,
        // 2
        icon: Icon(isLiked ? Icons.thumb_up_alt : Icons.thumb_up_off_alt));
  }
}
```

***Giải thích:***

1. Mình sẽ tạo ra biến `isLiked` kiểu bool với giá trị `true` nghĩa là user đã like và `false` là chưa like. Ở đây mình để giá trị default là false.

2. Thay đổi ảnh của button tương ứng với trạng thái isLiked.

3. Khi user tương tác với button, mình sẽ thực hiện việc đảo trạng thái của biến `isLiked` và thông báo cho framework thông qua việc gọi hàm `setState()`

Vậy là xong! Chúng ta cùng build lên xem kết quả nhé! Hiện tại, mình vẫn giữ `MyHomePage` giống như phần StatelessWidget nha!

![7](https://github.com/vanle57/stateless-stateful-widget/blob/main/images/7.gif)

Các bạn có để ý thấy phần `Text` ở dưới vẫn chưa khớp với trạng thái của button không? Đây là lúc chúng ta sẽ biến `MyHomePage` thành một StatefulWidget luôn!

##### Bước 3: Chuyển đổi MyHomePage thành StatefulWidget.

Tương tự như mình đã nhắc ở bước 1, các bạn có thể convert `MyHomePage` thành StatefulWidget bằng cách di chuyển con trỏ về đầu dòng class `MyHomePage` -> click vào bóng đèn màu vàng chọn *Convert to StatefulWidget*.

Tiếp theo, các bạn quay trở lại class `LikeButton` để thêm callback về nhằm thông báo cho `MyHomePage` biết trạng thái `isLiked`

```dart
import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  // 1
  final Function(bool) didTapButton;
  // 2
  const LikeButton(this.didTapButton, {Key? key}) : super(key: key);

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            isLiked = !isLiked;
            // 3
            widget.didTapButton(isLiked);
          });
        },
        iconSize: 50,
        icon: Icon(isLiked ? Icons.thumb_up_alt : Icons.thumb_up_off_alt));
  }
}
```

***Giải thích:***

1. `didTapButton` là 1 biến kiểu function và trả về kiểu `bool`. Biến được khai báo là final vì nó sẽ không thay đổi.

2. Tạo constructor để init biến `didTapButton`.

3. Sau khi `isLiked` được đảo trạng thái, chúng ta đồng thời callback trạng thái này ra để `MyHomePage` nhận biết sự thay đổi.

Sau khi sửa lại LikeButton, bạn quay lại MyHomePage và tiếp tục xử lý phần thay đổi Text:

```dart
class _MyHomePageState extends State<MyHomePage> {
  // 1
  String likedStatusText = 'You have not like yet!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StatefulWidget Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 3
            LikeButton((isLiked) {
              // 4
              setState(() {
                likedStatusText =
                  isLiked ? 'You liked!' : 'You have not like yet!';
              });
            }),
            // 2
            Text(likedStatusText),
          ],
        ),
      ),
    );
  }
}
```

***Giải thích:***

1. Khai báo biến kiểu `String` trong State object của `MyHomePage`. Đây sẽ là nơi nhận sự thay đổi text.

2. Lúc này `Text` sẽ sử dụng biến state chúng ta vừa tạo thay vì text set cứng như lúc đầu.

3. Truyền vào đối số cho callback function của `LikeButton`.

4. Khi nhận được callback trả về state của `LikeButton` thì `MyHomePage` sẽ gọi hàm `setState()` để set text tương ứng cho `likedStatusText` từ đó kích hoạt Flutter render lại UI.

##### Kết quả

![8](https://github.com/vanle57/stateless-stateful-widget/blob/main/images/8.gif)

## 6. Tổng kết

Tóm lại sự khác nhau rõ rệt và có thể dễ dàng thấy được nhất giữa StalessWidget và StatefulWidget chính là khả năng reload của widget ở runtime. Nếu như StalessWidget không thể thay đổi chỉ trừ khi được khởi tạo lại thì StatefulWidget có các trạng thái có thể thay đổi được và Flutter sẽ render lại UI cho phù hợp với từng trạng thái.

Bài viết cũng khá dài nên mình xin tạm gác bút lại ở đây. Hẹn gặp các bạn vào các bài viết tiếp theo của mình nhé!

#### Tài liệu tham khảo

- [StatelessWidget class - widgets library - Dart API](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html)

- [StatefulWidget class - widgets library - Dart API](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)

- [StatelessWidget và StatefulWidget trong Flutter - Blog Lập Trình](https://bloglaptrinh.info/statelesswidget-va-statefulwidget-trong-flutter/)

- [Flutter rules the World: Widget, Stateful Widget and Stateless Widget! - TMA Solutions](https://www.tma.vn/Hoi-dap/Cam-nang-nghe-nghiep/Flutter-rules-the-World-Widget-Stateful-Widget-and-Stateless-Widget/57102)

- [Flutter cơ bản: State trong Flutter](https://200lab.io/blog/flutter-co-ban-state-trong-flutter/)
