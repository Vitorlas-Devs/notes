mod dispenser;
use dispenser::*;

fn main() {
    let mut dp = SoapDispenser::new(40, 2);

    println!("{dp}");

    dp.push();
    dp.push();
    dp.push();

    println!("{dp}");

    dp.refill();

    println!("{dp}");
}
