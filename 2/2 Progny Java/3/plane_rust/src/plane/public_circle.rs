use crate::point::Point;

pub struct PublicCircle {
    pub center: Point,
    pub radius: f64,
}

impl PublicCircle {
    pub fn new() -> PublicCircle {
        PublicCircle {
            center: Point::origin(),
            radius: 1.0,
        }
    }

    pub fn getArea(&self) -> f64 {
        std::f64::consts::PI * self.radius * self.radius
    }
}
