set(HDRS sip.h sipint.h array.h)

set(SRCS siplib.c apiversions.c descriptors.c qtlib.c threads.c objmap.c
voidptr.c array.c int_convertors.c bool.cpp)

add_library(sip ${SRCS})
target_link_libraries(sip)
target_include_directories(sip PUBLIC ${CMAKE_INSTALL_PREFIX}/include/python2.7)

INSTALL(TARGETS sip ARCHIVE DESTINATION lib INCLUDES DESTINATION include)
INSTALL(FILES ${HDRS} DESTINATION include)
