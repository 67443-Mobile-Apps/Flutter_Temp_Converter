class Model {
  double temp;
  String mode;

  Model() {
    temp = 32;
    mode = "°F";
  }

  void setTemp(double t) {
    temp = t;
  }

  void toggle() {
    if (mode == "°F") {
      mode = "°C";
    } else {
      mode = "°F";
    }
  }

  double convert() {
    if (temp <= -500) {
      return -500;
    }
    if (mode == "°F") {
      return (temp - 32) * 5 / 9;
    } else {
      return temp / 5 * 9 + 32;
    }
  }

  String convertS() {
    return convert().toStringAsFixed(1) + (mode == "°F" ? "°C" : "°F");
  }
}
