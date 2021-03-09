# add CURL if available
find_package(CURL)

if(CURL_FOUND)
    OPTION(vsgXchange_CURL "Optional CURL support provided" ON)
endif()

if(${vsgXchange_GDAL})
    set(SOURCES ${SOURCES}
        curl/curl.cpp
    )
    set(EXTRA_LIBRARIES ${EXTRA_LIBRARIES} ${CURL_LIBRARIES})
    set(FIND_DEPENDENCY ${FIND_DEPENDENCY} "find_dependency(CURL)")
else()
    set(SOURCES ${SOURCES}
        curl/CURL_fallback.cpp
    )
endif()
