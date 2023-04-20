class Todo {
  String title;
  String text;
  bool isChecked;

  Todo({required this.title, required this.text, this.isChecked = false});

  setIsChecked(value) {
    isChecked = value;
  }

  update(title, text) {
    this.title = title;
    this.text = text;
  }
}
