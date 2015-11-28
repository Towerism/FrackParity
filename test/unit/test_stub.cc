#include <gtest/gtest.h>
#include <stub.hh>

TEST(TEST_STUB, RETURN_ONE_RETURNS_ONE) {
  EXPECT_EQ(1, return_one());
}
