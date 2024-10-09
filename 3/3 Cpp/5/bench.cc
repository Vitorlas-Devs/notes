#include <chrono>
#include <immintrin.h> // For Intel intrinsics
#include <iostream>
#include <list>
#include <vector>


const int SIZE = 10'000'000;

// Ensure SIZE is divisible by 8 for AVX operations
static_assert(SIZE % 8 == 0, "SIZE must be divisible by 8 for AVX");

int main() {
  // Array (vector)
  std::vector<int> vec(SIZE);
  for (int i = 0; i < SIZE; ++i)
    vec[i] = i;

  // Linked list
  std::list<int> lst;
  for (int i = 0; i < SIZE; ++i)
    lst.push_back(i);

  // Measure time for vector traversal
  auto start = std::chrono::high_resolution_clock::now();
  long long sum = 0;
  for (int i = 0; i < SIZE; ++i)
    sum += vec[i];
  auto end = std::chrono::high_resolution_clock::now();
  std::chrono::duration<double> vec_time = end - start;

  // Measure time for list traversal
  start = std::chrono::high_resolution_clock::now();
  sum = 0;
  for (const auto &item : lst)
    sum += item;
  end = std::chrono::high_resolution_clock::now();
  std::chrono::duration<double> list_time = end - start;

  // Measure time for SIMD vector traversal
  start = std::chrono::high_resolution_clock::now();
  __m256i simd_sum = _mm256_setzero_si256();
  for (int i = 0; i < SIZE; i += 8) {
    __m256i vec_values = _mm256_loadu_si256((__m256i *)&vec[i]);
    simd_sum = _mm256_add_epi32(simd_sum, vec_values);
  }
  // Horizontal sum of SIMD vector
  __m256i hi_sum = _mm256_permute2x128_si256(simd_sum, simd_sum, 1);
  __m256i sum_1 = _mm256_add_epi32(simd_sum, hi_sum);
  __m256i sum_2 = _mm256_hadd_epi32(sum_1, sum_1);
  __m256i sum_3 = _mm256_hadd_epi32(sum_2, sum_2);
  sum = _mm256_extract_epi32(sum_3, 0) + _mm256_extract_epi32(sum_3, 4);
  end = std::chrono::high_resolution_clock::now();
  std::chrono::duration<double> simd_time = end - start;

  std::cout << "Vector traversal time: " << vec_time.count() << " seconds\n";
  std::cout << "List traversal time: " << list_time.count() << " seconds\n";
  std::cout << "SIMD vector traversal time: " << simd_time.count()
            << " seconds\n";
  std::cout << "Sum: " << sum << std::endl;

  return 0;
}
