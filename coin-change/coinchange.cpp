#include <iostream>

using namespace std;

int main() {
    int m;
    int n;

    cin >> n;
    cin >> m;
    int *coins = new int[m];
    for (int i = 0; i < m; i++) {
        cin >> coins[i];
    }

    int *exchange_ways = new int[n+1];

    exchange_ways[0] = 1;

    for (int i = 1; i <= n; i++) {
        int s = 0;
        for (int j = 0; j < m; j++) {
            if (i - coins[j] < 0) {
                continue;
            }

            s += exchange_ways[i-coins[j]];
        }

        exchange_ways[i] = s;
        cout << "i: " << i << " ways: " << exchange_ways[i] << endl;
    }

    cout << exchange_ways[n] << endl;

    delete[] exchange_ways;
    delete[] coins;
    return 0;
}
