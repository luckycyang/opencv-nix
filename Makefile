# Define the build directory
BUILD_DIR := build

# Define the build target
TARGET := OpenCVApp

MAKE := ninja

# Default target to run configure and build
all: $(BUILD_DIR)
	@$(MAKE) -C $(BUILD_DIR)

# Create the build directory and run cmake
$(BUILD_DIR):
	@mkdir -p $(BUILD_DIR)
	@cd $(BUILD_DIR) && cmake .. -GNinja

# Clean the build directory
clean:
	@rm -rf $(BUILD_DIR)

# Install target (if you have an install target in CMakeLists.txt)
install:
	@cd $(BUILD_DIR) && $(MAKE) install

.PHONY: all clean install

