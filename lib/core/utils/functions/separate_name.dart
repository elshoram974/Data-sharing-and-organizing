({String fName, String lName}) separateName(String fullName) {
  final List<String> nameParts = fullName.split(" ");
  return (
    fName: nameParts.first.trim(),
    lName: nameParts.sublist(1).join(" ").trim(),
  );
}
