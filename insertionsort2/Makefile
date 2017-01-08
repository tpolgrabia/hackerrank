PROG_NAME=insertionsort2

all: bin bin/$(PROG_NAME)

BINARIES=bin/$(PROG_NAME).cpp.o

bin/$(PROG_NAME): bin/$(PROG_NAME).cpp.o
	$(CXX) -o $@ $^

bin/%.cpp.o: src/%.cpp
	$(CXX) -c -o $@ $<

bin:
	mkdir -p bin

.PHONY: clean

clean:
	rm -rf bin
