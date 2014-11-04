TEST_STATISTICS_NAME=statistics
TEST_STATISTICS_EXECUTABLE=tests/test_$(TEST_STATISTICS_NAME)
TEST_STATISTICS_OBJECTS=tests/test_$(TEST_STATISTICS_NAME).o
TEST_EXECUTABLES+=$(TEST_STATISTICS_EXECUTABLE)
TEST_OBJECTS+=$(TEST_STATISTICS_OBJECTS)
$(TEST_STATISTICS_EXECUTABLE): $(LIBRARY_OBJECTS) $(TEST_STATISTICS_OBJECTS) $(TEST_LIBRARY_OBJECTS)
	$(Q)$(ECHO) "  LD $@"
	$(Q)$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS) $(CONFIG_LDFLAGS)
TEST_STATISTICS_RUN=test_run_$(TEST_STATISTICS_NAME)
$(TEST_STATISTICS_RUN): $(TEST_STATISTICS_EXECUTABLE)
	./$^
TEST_RUNS+=$(TEST_STATISTICS_RUN)

