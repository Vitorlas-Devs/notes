pub struct Point {
    pub x: f64,
    pub y: f64,
}

impl Point {
    pub fn new(x: f64, y: f64) -> Point {
        Point { x, y }
    }

    pub fn origin() -> Point {
        Point { x: 0.0, y: 0.0 }
    }
}
