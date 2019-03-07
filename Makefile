CC=clang-7
CXX=clang++-7

FOLLY=/root/proxygen/proxygen/folly

all: Fuzzer

clean:
        rm -rf Fuzzer

Fuzzer: macaddr-fuzz.cpp

        $(CXX) -o macfuzz -ggdb macaddr-fuzz.cpp -I$(FOLLY)/include $(FOLLY)/_build/libfolly.so -fsanitize=fuzzer,address,undefined -lfolly -lglog -lboost_system
