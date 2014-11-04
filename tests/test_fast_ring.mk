TEST_FAST_RING_NAME=fast_ring
TEST_FAST_RING_EXECUTABLE=tests/test_$(TEST_FAST_RING_NAME)
TEST_FAST_RING_OBJECTS=tests/test_$(TEST_FAST_RING_NAME).o
TEST_EXECUTABLES+=$(TEST_FAST_RING_EXECUTABLE)
TEST_OBJECTS+=$(TEST_FAST_RING_OBJECTS)
$(TEST_FAST_RING_EXECUTABLE): $(LIBRARY_OBJECTS) $(TEST_FAST_RING_OBJECTS) $(TEST_LIBRARY_OBJECTS)
	$(Q)$(ECHO) "  LD $@"
	$(Q)$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS) $(CONFIG_LDFLAGS)
TEST_FAST_RING_RUN=test_run_$(TEST_FAST_RING_NAME)
$(TEST_FAST_RING_RUN): $(TEST_FAST_RING_EXECUTABLE)
	./$^
TEST_RUNS+=$(TEST_FAST_RING_RUN)

