#include <iostream>
#include <vector>
#include <queue>
#include <cmath>

using namespace std;

struct Node {
    int state;
    int cost;
    int estimated_cost;
    Node* parent;

    Node(int s, int c, int e, Node* p = nullptr) : state(s), cost(c), estimated_cost(e), parent(p) {}
};

struct CompareNode {
    bool operator()(Node* const& n1, Node* const& n2) {
        return n1->estimated_cost > n2->estimated_cost;
    }
};

class BeamSearch {
public:
    BeamSearch(int start, int goal, int beam_width) : start(start), goal(goal), beam_width(beam_width) {}

    vector<int> search() {
        priority_queue<Node*, vector<Node*>, CompareNode> beam;
        beam.push(new Node(start, 0, heuristic(start)));

        while (!beam.empty()) {
            priority_queue<Node*, vector<Node*>, CompareNode> next_beam;

            while (!beam.empty()) {
                Node* node = beam.top();
                beam.pop();

                if (node->state == goal) {
                    return construct_path(node);
                }

                vector<Node*> children = expand(node);
                for (Node* child : children) {
                    next_beam.push(child);
                    if (next_beam.size() > beam_width) {
                        next_beam.pop();
                    }
                }
            }

            beam = next_beam;
        }

        return vector<int>(); // ゴールに到達できなかった場合
    }

private:
    int start;
    int goal;
    int beam_width;

    vector<Node*> expand(Node* node) {
        vector<Node*> children;
        vector<pair<int, int> > transitions;
        transitions.push_back(make_pair(1, 2));
        transitions.push_back(make_pair(2, 3));
        transitions.push_back(make_pair(3, 4));

        for (auto& transition : transitions) {
            int new_state = transition.first;
            int cost = transition.second;
            int new_cost = node->cost + cost;
            int estimated_cost = new_cost + heuristic(new_state);
            children.push_back(new Node(new_state, new_cost, estimated_cost, node));
        }

        return children;
    }

    int heuristic(int state) {
        return abs(goal - state); // ゴールまでの推定コストを計算するヒューリスティック関数
    }

    vector<int> construct_path(Node* node) {
        vector<int> path;
        while (node) {
            path.push_back(node->state);
            node = node->parent;
        }
        reverse(path.begin(), path.end());
        return path;
    }
};

int main() {
    int start = 0;
    int goal = 10;
    int beam_width = 2;

    BeamSearch beam_search(start, goal, beam_width);
    vector<int> path = beam_search.search();

    if (!path.empty()) {
        cout << "Path found: ";
        for (int state : path) {
            cout << state << " ";
        }
        cout << endl;
    } else {
        cout << "No path found." << endl;
    }

    return 0;
}
