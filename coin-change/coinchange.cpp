#include <iostream>

using namespace std;

void dump_mat(unsigned long **arr, unsigned long m, unsigned long n) {
    for (unsigned long i = 0; i <= m; i++) {
        for (unsigned long j = 0; j <= n; j++) {
            cout << arr[i][j] << " ";
        }
        cout << endl;
    }
}

int main() {
    unsigned long m;
    unsigned long n;

    cin >> n;
    cin >> m;
    unsigned long *coins = new unsigned long[m+1];
    coins[0] = 0;
    for (unsigned long i = 1; i <= m; i++) {
        cin >> coins[i];
    }

    unsigned long **exchange_ways = new unsigned long*[m+1];
    for (unsigned long i = 0; i <= m; i++) {
	    exchange_ways[i] = new unsigned long[n+1];
    }

    for (unsigned long i = 0; i <= n; i++) {
    	exchange_ways[0][i] = 0;
    }
    // cout << "Starting" << endl;
    exchange_ways[0][0] = 1;

    for (unsigned long i = 1; i <= m; i++) {
	// we are choosing the coin right now <= i (subset)
	// cout << "Loop i: " << i << endl;
        for (unsigned long j = 0; j <= n; j++) {
            // we are solving problem for every coin value
            // cout << "Loop j: " << j << endl;
            unsigned long combinations = 0;
            for (unsigned long k = 0; j >= k*coins[i]; k++) {
                // cout << "I: " << i << ", J: " << j << ", K: " << k << endl;
                unsigned long val = exchange_ways[i-1][j - k*coins[i]];
                /*
                if (val > 0) {
                    cout << "N: " << j << ", K: " << k
                     << ", exchange: " << j - k*coins[i]
                     << ", cidx: " << i
                     << ", coin: " << coins[i] << endl;
                }
                */
                combinations += val;
            }
            exchange_ways[i][j] = combinations;
        }
    }

    // cout << "Finished" << endl;
    // dump_mat(exchange_ways, m, n);

    cout << exchange_ways[m][n] << endl;

    for (unsigned long i = 0; i <= m; i++) {
	    delete[] exchange_ways[i];
    }
    delete[] exchange_ways;
    delete[] coins;
    return 0;
}
