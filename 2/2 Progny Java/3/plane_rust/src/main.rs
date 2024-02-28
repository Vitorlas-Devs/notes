mod plain;
mod point;

use public_circle::PublicCircle;

fn main() {
    let mut c = PublicCircle::new();
    println!("Area: {}", c.getArea());

    c.center.x = 5.0;
    c.center.y = 2.0;
    c.radius = 10.0;
    println!("New Area: {}", c.getArea());
}
