#!/bin/bash
sar 1 1 -P ALL >> cpu-$1.txt
sar -r 1 1 -P ALL >> ram-$1.txt