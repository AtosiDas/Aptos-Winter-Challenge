// SPDX-License-Identifier: MIT

module Challenge {
  resource T {
    // Define state variables here
    login_users: vector<address>;
    count_per_user: vector<u64>;
    is_login: vector<bool>;
    total_count: u64;
  }

  // LogIn function
  public fun LogIn() {
    // Require statement
    assert(!T.is_login[move(sender)], 101);
    // Push the sender's address to the vector
    T.login_users.push_back(move(sender));
    // Set is_login to true for the sender's address
    T.is_login[move(sender)] = true;
  }

  // Transaction function
  public fun Transaction(addr: address, amount: u64) {
    // Require statements
    assert(move(sender) != addr, 102);
    assert(T.is_login[move(sender)], 103);
    assert(amount > 0, 104);
    // Transfer the amount to the specified address
    LibraAccount.pay_from_sender(move(addr), move(amount));
    // Increment count_per_user for the sender's address
    T.count_per_user[move(sender)] = T.count_per_user[move(sender)] + 1;
    // Increment total_count
    T.total_count = T.total_count + 1;
  }

  // GetTotalCount function
  public fun GetTotalCount(): u64 {
    // Return the total_count
    return T.total_count;
  }

  // GetCountPerUser function
  public fun GetCountPerUser(): u64 {
    // Return count_per_user for the sender's address
    return T.count_per_user[move(sender)];
  }
}
