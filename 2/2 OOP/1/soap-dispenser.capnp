@0x8cae971c6efcc697;

interface SoapDispenser {
  struct SoapDispenser {
    current @0 :UInt16;
    capacity @1 :UInt16;
    drop @2 :UInt16;
  }
  
  new @0 (capacity :UInt16, drop :UInt16) -> (dp :SoapDispenser);
  push @1 ();
  refill @2 ();
}


