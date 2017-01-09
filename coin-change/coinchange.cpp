#include <iostream>

using namespace std;

void dump_mat(int **arr, int m, int n) {
    for (int i = 0; i <= m; i++) {
	for (int j = 0; j <= n; j++) {
	    cout << arr[i][j] << " ";
	}
	cout << endl;
    }
}

int main() {
    int m;
    int n;

    cin >> n;
    cin >> m;
    int *coins = new int[m+1];
    coins[0] = 0;
    for (int i = 1; i <= m; i++) {
        cin >> coins[i];
    }

    int **exchange_ways = new int*[m+1];
    for (int i = 0; i <= m; i++) {
	exchange_ways[i] = new int[n+1];
    }
    

    for (int i = 0; i <= n; i++) {
	exchange_ways[0][i] = 0;
    }
    // cout << "Starting" << endl;
    exchange_ways[0][0] = 1;

    for (int i = 1; i <= m; i++) {
	// we are choosing the coin right now <= i (subset)
	// cout << "Loop i: " << i << endl;
	for (int j = 0; j <= n; j++) {
	    // we are solving problem for every coin value
	    // cout << "Loop j: " << j << endl;
	    int combinations = 0;
	    for (int k = 0; j - k*coins[i] >= 0; k++) {
		// cout << "I: " << i << ", J: " << j << ", K: " << k << endl;
		int val = exchange_ways[i-1][j - k*coins[i]];
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

    for (int i = 0; i <= m; i++) {
	delete[] exchange_ways[i];
    }
    
    delete[] exchange_ways;
    delete[] coins;
    return 0;
}
