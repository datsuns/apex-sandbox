
#include "hello/hello.h"
#include <gtest/gtest.h>

TEST(Greet, Basic) {
  EXPECT_EQ(greet("World"), "Hello, World!");
}
