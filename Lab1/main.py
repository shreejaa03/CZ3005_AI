
import task1
from timeit import timeit
from typing import Tuple
import json

PERF_SAMPLES = 5000

PathInfo =''


def main():
    G, Cost, Coord, Dist = load_json_files()
    path1 = task1.ucs('1', '50', Dist, G)


def load_json_files():
    g = open("G.json")
    cost = open("Cost.json")
    coord = open("Coord.json")
    dist = open("Dist.json")
    G = json.load(g)
    Cost = json.load(cost)
    Coord = json.load(coord)
    Dist = json.load(dist)
    return G, Cost, Coord, Dist
    

if __name__ == "__main__":
    main()
