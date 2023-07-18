# --- Import tools ----
include(cmake/tools.cmake)

# ---- Dependencies ----
include(cmake/CPM.cmake)

# spdlog
CPMAddPackage(
  NAME spdlog
  GITHUB_REPOSITORY gabime/spdlog
  GIT_TAG v2.x
)

# GLM
CPMAddPackage(
  NAME glm
  GITHUB_REPOSITORY g-truc/glm
  GIT_TAG 0.9.9.8
)

# GLFW
CPMAddPackage(
  NAME glfw
  GITHUB_REPOSITORY glfw/glfw
  GIT_TAG 3.3.8
  OPTIONS
	"GLFW_BUILD_TESTS Off"
	"GLFW_BUILD_EXAMPLES Off"
	"GLFW_BUILD_DOCS Off"
    "GLFW_INSTALL Off"
    "GLFW_USE_HYBRID_HPG On"
)
