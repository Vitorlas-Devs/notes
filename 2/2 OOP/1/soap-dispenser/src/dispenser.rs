use std::fmt::{Display, Formatter, Result};

#[derive(Debug)]
pub struct SoapDispenser {
    current: u32,
    capacity: u32,
    drop: u32,
}

impl SoapDispenser {
    pub fn new(capacity: u32, drop: u32) -> Self {
        if capacity < drop {
            panic!("Drop size cannot be larger than capacity");
        }

        SoapDispenser {
            current: capacity,
            capacity,
            drop,
        }
    }

    pub fn push(&mut self) {
        // max of 0 or current - drop
        self.current = self.current.saturating_sub(self.drop);
        println!(" -> {}", self.drop);
    }

    pub fn refill(&mut self) {
        self.current = self.capacity;
    }
}

impl Display for SoapDispenser {
    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
        write!(f, "SoapDispenser [ {}/{} ]", self.current, self.capacity)
    }
}
