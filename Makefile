CXX=g++
CPPFLAGS=-std=c++11 -Wall -Wextra -pedantic -O3
PROCTREE_LDFLAGS=
HAPPYTREE_LDFLAGS=-lGL -lSDL2
PROCTREE_DIR=proctree
HAPPYTREE_DIR=happytree
RM=rm -f


all: $(PROCTREE_DIR)/proctree $(HAPPYTREE_DIR)/happytree
	@echo "complete"

$(PROCTREE_DIR)/proctree: $(PROCTREE_DIR)/main.o $(PROCTREE_DIR)/proctree.o
	$(CXX) $(CPPFLAGS) $(PROCTREE_DIR)/main.o $(PROCTREE_DIR)/proctree.o -o $(PROCTREE_DIR)/proctree $(PROCTREE_LDFLAGS)
	@echo "proctree built"

$(PROCTREE_DIR)/main.o: $(PROCTREE_DIR)/main.cpp
	$(CXX) $(CPPFLAGS) -c $(PROCTREE_DIR)/main.cpp -o $(PROCTREE_DIR)/main.o

$(PROCTREE_DIR)/proctree.o: $(PROCTREE_DIR)/proctree.cpp $(PROCTREE_DIR)/proctree.h
	$(CXX) $(CPPFLAGS) -c $(PROCTREE_DIR)/proctree.cpp -o $(PROCTREE_DIR)/proctree.o

%.o: %.cpp
	$(CXX) $(CPPFLAGS) -c $< -o $@

%.o: %.c
	$(CC) $(CPPFLAGS) -c $< -o $@

$(HAPPYTREE_DIR)/happytree: $(HAPPYTREE_DIR)/main.o $(HAPPYTREE_DIR)/diskio.o $(HAPPYTREE_DIR)/GLee.o $(HAPPYTREE_DIR)/glstuff.o $(HAPPYTREE_DIR)/imgui.o $(HAPPYTREE_DIR)/imgui_impl.o $(HAPPYTREE_DIR)/presets.o $(HAPPYTREE_DIR)/shader.o $(HAPPYTREE_DIR)/stb_image.o $(HAPPYTREE_DIR)/toolkit.o $(PROCTREE_DIR)/proctree.o
	$(CXX) $(CPPFLAGS) -o $@ $(HAPPYTREE_LDFLAGS) $^
	@echo "happytree built"

clean:
	$(RM) $(PROCTREE_DIR)/*.o $(PROCTREE_DIR)/proctree $(HAPPYTREE_DIR)/*.o $(HAPPYTREE_DIR)/happytree
	@echo "done"
