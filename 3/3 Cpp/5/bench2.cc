#include <iostream>
#include <vector>
#include <list>
#include <chrono>
#include <immintrin.h> // For Intel intrinsics

const int SIZE = 10'000'000;

// Custom vector-like class optimized for SIMD operations
class SimdVector {
private:
    int* data;
    size_t size_;
    size_t capacity_;

public:
    SimdVector() : data(nullptr), size_(0), capacity_(0) {}

    ~SimdVector() {
        if (data) _mm_free(data);
    }

    void push_back(int value) {
        if (size_ == capacity_) {
            size_t new_capacity = capacity_ == 0 ? 1 : capacity_ * 2;
            int* new_data = (int*)_mm_malloc(new_capacity * sizeof(int), 32);
            if (data) {
                std::memcpy(new_data, data, size_ * sizeof(int));
                _mm_free(data);
            }
            data = new_data;
            capacity_ = new_capacity;
        }
        data[size_++] = value;
    }

    size_t size() const { return size_; }
};

int main() {
    std::vector<int> vec;
    std::list<int> lst;
    SimdVector simd_vec;

    // Vector insertion
    auto start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < SIZE; ++i) {
        vec.push_back(i);
    }
    auto end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> vec_time = end - start;

    // List insertion
    start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < SIZE; ++i) {
        lst.push_back(i);
    }
    end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> list_time = end - start;

    // SIMD Vector insertion
    start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < SIZE; ++i) {
        simd_vec.push_back(i);
    }
    end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> simd_time = end - start;

    std::cout << "Vector insertion time: " << vec_time.count() << " seconds\n";
    std::cout << "List insertion time: " << list_time.count() << " seconds\n";
    std::cout << "SIMD Vector insertion time: " << simd_time.count() << " seconds\n";

    std::cout << "Vector size: " << vec.size() << std::endl;
    std::cout << "List size: " << lst.size() << std::endl;
    std::cout << "SIMD Vector size: " << simd_vec.size() << std::endl;

    return 0;
}
