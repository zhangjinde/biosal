#!/bin/bash

mpiexec -n 1 performance/latency_probe/latency_probe -threads-per-node 1 \
    -print-thorium-data
