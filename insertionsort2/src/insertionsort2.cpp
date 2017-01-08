#include <iostream>

using namespace std;

void dump_arr(int *arr, int n) {
  if (arr == NULL || n <= 0) {
    return;
  }

  for (int i = 0; i < n - 1; i++) {
    cout << arr[i] << " ";
  }

  cout << arr[n-1] << endl;
}

void insertion_sort(int *nrs, int n) {
  int temp;
  for (int i = 1; i < n; i++) {
    for (int j = 0; j < i; j++) {
      if (nrs[j] > nrs[i]) {
	temp = nrs[i];
	for (int k = i; k > j; k--) {
	  nrs[k] = nrs[k-1];
	}

	nrs[j] = temp;
	break;
      }
    }
    dump_arr(nrs, n);
  }
}

int main() {
  int n;
  cin >> n;

  int *nrs = new int[n];

  for (int i = 0; i < n; i++) {
    cin >> nrs[i];
  }

  insertion_sort(nrs, n);
  delete[] nrs;
  return 0;
}
