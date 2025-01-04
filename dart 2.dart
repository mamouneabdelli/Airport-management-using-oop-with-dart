import 'dart:io';

void main() {
  Passenger passenger = Passenger();
  passenger.adding();

  print("Enter the destination:");
  String? destination = stdin.readLineSync();
  if (destination == null || destination.isEmpty) {
    print("Invalid destination.");
    return;
  }

  print("Enter the departure date (YYYY-MM-DD):");
  DateTime? departureDate = DateTime.tryParse(stdin.readLineSync()!);
  if (departureDate == null) {
    print("Invalid departure date.");
    return;
  }

  print("Enter the arrival date (YYYY-MM-DD):");
  DateTime? arrivalDate = DateTime.tryParse(stdin.readLineSync()!);
  if (arrivalDate == null) {
    print("Invalid arrival date.");
    return;
  }

  Ticket ticket = Ticket(destination, departureDate, arrivalDate, passenger);
  ticket.displayTicketInfo();
}

class Passenger {
  List<int> passportNumbers = [];
  List<String> names = [];

  Passenger();

  void adding() {
    print("Enter the number of passengers:");
    int? numberOfPassengers = int.tryParse(stdin.readLineSync()!);
    if (numberOfPassengers == null) {
      print("Invalid input. Please enter a valid number.");
      return;
    }
    if (numberOfPassengers <= 0) {
      print("the entred number is not valid ");
      
    }

    print("Enter your passport ID then your name for each passenger:");
    for (int i = 0; i < numberOfPassengers; i++) {
      print("Passport ID for passenger ${i + 1}:");
      int? passportId = int.tryParse(stdin.readLineSync()!);
      if (passportId == null) {
        print("Invalid passport ID. Please enter a valid number.");
        i--;
        continue;
      }
      if (passportId <= 0) {
        print("the entred number is not valid ");
      }
      print("Name for passenger ${i + 1}:");
      String? name1 = stdin.readLineSync();
      if (name1 == null || name1.isEmpty) {
        print("Invalid name. Please enter a valid name.");
        i--;
        continue;
      }

      passportNumbers.add(passportId);
      names.add(name1);

      print("The passengers have been added successfully.");
    }
  }

  void displayAllPassengers() {
    for (int i = 0; i < passportNumbers.length; i++) {
      print(
          'Passenger ${i + 1}: Passport ID = ${passportNumbers[i]}, Name = ${names[i]}');
    }
  }
}

class Ticket {
  String destination;
  DateTime departureDate;
  DateTime arrivalDate;
  Passenger passenger;

  Ticket(
      this.destination, this.departureDate, this.arrivalDate, this.passenger);

  void displayTicketInfo() {
    for (int i = 0; i < passenger.passportNumbers.length; i++) {
      print(
          'Passenger Name: ${passenger.names[i]}, Passport Number: ${passenger.passportNumbers[i]}');
    }
    print('Destination: $destination');
    print('Departure Date: $departureDate');
    print('Arrival Date: $arrivalDate');
  }
}
