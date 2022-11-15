from queue import PriorityQueue

def ucs(source, dest,dist, g):
    path = "No path found"
    dist = dist


    prio_queue = PriorityQueue()
    prio_queue.put((0, [source]))

    visited = set()

    while prio_queue.not_empty:
        pair = prio_queue.get()

        current_path = pair[1]
        current_node = current_path[-1]

        if current_node not in visited:
            visited.add(current_node)

            if current_node == dest:
                path = "->".join(current_path)

                total_dist = 0
                for i in range(len(current_path) - 1):
                    total_dist += dist[f"{current_path[i]},{current_path[i+1]}"]
                dist = total_dist
                print(f"Shortest path: {path}")
                print(f"Shortest distance: {dist}")

                return path, dist

            for next in g[current_node]:
                new_dist = dist[f"{current_node},{next}"]
                score = pair[0] + new_dist

                new_path = list(pair[1])
                new_path.append(next)

                prio_queue.put((score, new_path))
                
    print(f"Shortest path: {path}")
    print(f"Shortest distance: {dist}")