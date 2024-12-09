import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Debug "mo:base/Debug";
import Iter "mo:base/Iter";

actor Token {
  let owner: Principal = Principal.fromText("46hdo-bcly3-ihpsi-jrgiz-fcvi3-cluam-pnpnf-hts27-msenz-zqdru-qae");
  let totalSupply: Nat = 1000000000;
  let symbol: Text = "DVIN";

  private stable var balanceEntires: [(Principal, Nat)] = [];
  private var balances = HashMap.HashMap<Principal, Nat>(1, Principal.equal, Principal.hash);

  public query func balanceOf(who:Principal) :async Nat {
    let balance: Nat = switch (balances.get(who)) {
      case null 0;
      case (?result) result;
    }; 
    return balance;
  };

  public shared(msg) func payOut(): async Text {

    if (balances.get(msg.caller) == null) {
      Debug.print(debug_show(msg.caller));
      let amount: Nat = 10000;
      let result = await transfer(msg.caller, amount);
      return result;
    } else {
      return "Already Claimed";
    }
  };

  public shared(msg) func transfer(to: Principal, amount: Nat): async Text {
    Debug.print(debug_show(msg.caller));
    let fromBalance: Nat = await balanceOf(msg.caller);

    if (fromBalance >= amount) {
      let newFromBalance: Nat = fromBalance - amount;
      balances.put(msg.caller, newFromBalance);

      let toBalance: Nat = await balanceOf(to);
      let newToBalance: Nat = toBalance + amount;
      balances.put(to, newToBalance);

      return "Success";
    } else {
      return "Insufficient Funds";
    }
  };

  system func preupgrade() {
    balanceEntires := Iter.toArray(balances.entries());
  };

  system func postupgrade() {
    balances := HashMap.fromIter<Principal, Nat>(balanceEntires.vals(), 1, Principal.equal, Principal.hash);
    if (balances.size() < 1) {
      balances.put(owner, totalSupply);
    };
  };

}