// module;  // Global module fragment

// #include <cmath>  // Traditional includes go here

export module math;  // Module declaration

export namespace math {
    double square(double x) {
        return x * x;
    }

    // double sqrt(double x) {
    //     return std::sqrt(x);
    // }
}
