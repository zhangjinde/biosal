TEST_HASH_TABLE_NAME=hash_table
TEST_HASH_TABLE_EXECUTABLE=tests/test_$(TEST_HASH_TABLE_NAME)
TEST_HASH_TABLE_OBJECTS=tests/test_$(TEST_HASH_TABLE_NAME).o
TEST_EXECUTABLES+=$(TEST_HASH_TABLE_EXECUTABLE)
TEST_OBJECTS+=$(TEST_HASH_TABLE_OBJECTS)
$(TEST_HASH_TABLE_EXECUTABLE): $(LIBRARY_OBJECTS) $(TEST_HASH_TABLE_OBJECTS) $(TEST_LIBRARY_OBJECTS)
	$(Q)$(ECHO) "  LD $@"
	$(Q)$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS) $(CONFIG_LDFLAGS)
TEST_HASH_TABLE_RUN=test_run_$(TEST_HASH_TABLE_NAME)
$(TEST_HASH_TABLE_RUN): $(TEST_HASH_TABLE_EXECUTABLE)
	./$^
TEST_RUNS+=$(TEST_HASH_TABLE_RUN)

