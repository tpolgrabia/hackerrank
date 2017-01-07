#include <iostream>

using namespace std;

void dump(int *arr, int n) {
    if (n == 0) {
        cout << endl;
        return;
    }

    for (int i = 0; i < n - 1; i++) {
        cout << arr[i] << " ";
    }
    cout << arr[n-1] << endl;
}

int main() {
    int n;
    cin >> n;

    int *nrs = new int[n];
    for (int i = 0; i < n; i++) {
        cin >> nrs[i];
    }

    int i = n-1;
    int e = nrs[i];
    while (i > 0 && nrs[i-1] > e) {
        nrs[i] = nrs[i-1];
        i--;
        dump(nrs, n);
    }

    nrs[i] = e;
    dump(nrs, n);

    delete[] nrs;
    return 0;
}
