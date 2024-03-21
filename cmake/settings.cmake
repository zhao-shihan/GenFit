# general settings for a cmake project
# less clutter in the real CMakeLists.txt file

# library *nix style versioning
SET( ${PROJECT_NAME}_SOVERSION "${${PROJECT_NAME}_VERSION_MAJOR}.${${PROJECT_NAME}_VERSION_MINOR}" )
SET( ${PROJECT_NAME}_VERSION   "${${PROJECT_NAME}_SOVERSION}.${${PROJECT_NAME}_VERSION_PATCH}" )
