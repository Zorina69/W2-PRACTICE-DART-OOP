class BankAccount {
    // TODO
    double currentBalance = 0;

    double get balance => currentBalance;

    double withdraw(double balance){
      if(currentBalance < balance){
        throw Exception("Insufficient balance for withdrawal!");
      }
      currentBalance -= balance;
      return currentBalance;
    }

    double credit(double balance){
      currentBalance +=balance;
      return currentBalance;
    }

    BankAccount(currentBalance);
}

class Bank {
    // TODO
    final Map<int, BankAccount> accounts = {};
    final String name;

    BankAccount createAccount(int id, String ownerName) {
    if (accounts.containsKey(id)) {
      throw Exception("Account with ID $id already exists!");
    }

    var newAccount = BankAccount(0);
    accounts[id] = newAccount;

    print("Account created for $ownerName with ID: $id at $name");
    return newAccount;
  }

    Bank({required this.name});
}
 
void main() {

  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
