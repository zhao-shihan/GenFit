# MACRO( ADD_GENFIT_TEST _testname )
#     # If we have tests enabled build all tests directly, otherwise build them
#     # only via the tests target
#     IF(BUILD_TESTING)
#       ADD_EXECUTABLE( ${_testname} ${ARGN} )
#     ELSE()
#       ADD_EXECUTABLE( ${_testname} EXCLUDE_FROM_ALL ${ARGN} )
#     ENDIF()
#     ADD_DEPENDENCIES( tests  ${_testname} )
#     TARGET_LINK_LIBRARIES( ${_testname} ${PROJECT_NAME}  ${ROOT_LIBS} -lGeom )
#     #INSTALL( TARGETS ${_testname} DESTINATION ${EXECUTABLE_INSTALL_DIR})
# ENDMACRO( ADD_GENFIT_TEST )

# MACRO (ROOT_GENERATE_DICTIONARY LIBNAME INFILES INCLUDE_DIRS_IN LINKDEF_FILE OUTFILE)
#     SET (INCLUDE_DIRS)
#     FOREACH (_current_FILE ${INCLUDE_DIRS_IN})
#         set(INCLUDE_DIRS ${INCLUDE_DIRS} -I${_current_FILE})
#     ENDFOREACH (_current_FILE ${INCLUDE_DIRS_IN})

#     SET(EXTRA_DICT_ARGS "")
#     STRING(REGEX REPLACE "^(.*)\\.(.*)$" "\\1_rdict.pcm" OUTFILE_PCM "${OUTFILE}")
#     STRING(REGEX REPLACE "^(.*)Dict\\.(.*)$" "\\1.rootmap" OUTFILE_RMF "${OUTFILE}")
#     SET (OUTFILES ${OUTFILE} ${OUTFILE_PCM} ${OUTFILE_RMF})
#     SET(EXTRA_DICT_ARGS -inlineInputHeader -rmf ${OUTFILE_RMF} -rml ${LIBNAME}${CMAKE_SHARED_LIBRARY_SUFFIX})

#     ADD_CUSTOM_COMMAND(OUTPUT ${OUTFILES}
#             COMMAND ${ROOT_CINT_EXECUTABLE}
#             ARGS -f ${OUTFILE} ${EXTRA_DICT_ARGS} ${INCLUDE_DIRS} ${INFILES} ${LINKDEF_FILE}
#             DEPENDS ${INFILES} ${LINKDEF_FILE})

#     STRING(REGEX REPLACE "/" "" OUTFILE_NO_SLASH "${OUTFILE}")
#     ADD_CUSTOM_TARGET(generate_${OUTFILE_NO_SLASH} DEPENDS ${OUTFILE})

#     # PCM files and rootmap-files should be installed
#     INSTALL(FILES ${OUTFILE_RMF} ${OUTFILE_PCM}
#             DESTINATION ${LIBRARY_OUTPUT_DIRECTORY})
# ENDMACRO (ROOT_GENERATE_DICTIONARY)
