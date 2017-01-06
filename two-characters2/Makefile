all: main

main: main.cpp.o
	$(CXX) -o $@ $^

%.cpp.o: %.cpp
	$(CXX) -c -o $@ $<
