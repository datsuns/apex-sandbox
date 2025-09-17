
#include <rclcpp/rclcpp.hpp>

int main(int argc, char* argv[]) {
  rclcpp::init(argc, argv);
  auto node = rclcpp::Node::make_shared("bazel_talker");
  auto timer = node->create_wall_timer(
      std::chrono::milliseconds(500),
      [node]() { RCLCPP_INFO(node->get_logger(), "Hello from Bazel + rclcpp"); });
  rclcpp::spin(node);
  rclcpp::shutdown();
  return 0;
}
