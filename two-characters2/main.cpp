#include <iostream>
#include <map>
#include <set>

using namespace std;

bool substring_check(string s, char a, char b) {
    int n = s.size();
    char c;
    int lidx = -1;
    for (int i = 0; i < n; i++) {
        c = s[i];
        if (c != a && c != b) {
            continue;
        }

        if (lidx >= 0) {
            if (s[lidx] == c) {
                return false;
            }
        }

        lidx = i;
    }

    return true;
}

int main() {
    int l;
    string s;

    cin >> l;
    cin >> s;
    // cout << "Result: " << l << ", " << s << endl;

    map<char, int> char_freq;
    set<char> unique_chars;
    int n = s.size();
    for (int i = 0; i < n; i++) {
        if (char_freq.find(s[i]) == char_freq.end()) {
            char_freq.insert(pair<char, int>(s[i], 1));
        } else {
            char_freq[s[i]] = char_freq[s[i]] + 1;
        }
        unique_chars.insert(s[i]);
    }

    for (std::map<char,int>::iterator it = char_freq.begin();
            it != char_freq.end(); ++it) {
        // cout << "Key: " << it->first << ", Value: " << it->second << endl;
    }

    map<char, set<char> > coicidences;
    for (int i = 0; i < n - 1; i++) {
        coicidences[s[i]].insert(s[i+1]);
        coicidences[s[i+1]].insert(s[i]);
    }

    char a;
    char b;
    int best = -1;
    int cs = -1;

    for (auto it1 = unique_chars.begin(); it1 != unique_chars.end(); it1++) {
        for (auto it2 = unique_chars.begin(); it2 != unique_chars.end(); it2++) {
            if (*it1 == *it2) {
                continue;
            }

            auto s1 = coicidences[*it1];
            auto s2 = coicidences[*it2];

            if (s1.find(*it1) != s1.end()) {
                // cout << "" << *it1 << " collides with " << *it1 << endl;
                continue;
            }

            if (s2.find(*it2) != s2.end()) {
                // cout << "" << *it2 << " collides with " << *it2 << endl;
                continue;
            }

            cs = char_freq[*it1] + char_freq[*it2];
            if (cs > best) {
                // cout << "Best now is " << *it1 << " and " << *it2
                //     << " with length " << cs << endl;
                if (!substring_check(s, *it1, *it2)) {
                    // performance issue
                    // the best algo would be a coicidence graph like I think
                    // but maybe it will do the thing enough well.
                    continue;
                }
                a = *it1;
                b = *it2;
                best = cs;
            }
        }
    }

    cout << best << endl;

}
