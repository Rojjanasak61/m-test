#!/bin/bash
sar 1 1 -P ALL >> $1.txt
sar -r 1 1 -P ALL >> $1.txt