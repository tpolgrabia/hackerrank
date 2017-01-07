#include <iostream>
#include <map>

using namespace std;

int main() {
    int n;
    int v;
    map<int, int> freqs;
    cin >> n;

    for (int i = 0; i < n; i++) {
        cin >> v;
        if (freqs.find(v) == freqs.end()) {
            freqs[v] = 1;
        } else {
            freqs[v]++;
        }
    }

    for (int i = 0; i < 99; i++) {
        cout << freqs[i] << " ";
    }

    cout << freqs[99] << endl;
    return 0;
}
