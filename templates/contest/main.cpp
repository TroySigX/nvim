/***************************/
/*** Author : TroySigX *****/
/***************************/
#include <bits/stdc++.h>
 
using namespace std;
 
namespace IO{
    void setIn(string s) {freopen(s.c_str(), "r", stdin);}
    void setOut(string s) {freopen(s.c_str(), "w", stdout);}
    void setIO(string s = ""){
        ios_base::sync_with_stdio(false);
        cin.tie(0); cout.tie(0);
        if (s == ""){
            #ifndef ONLINE_JUDGE
                cin.exceptions(cin.failbit);
                setIn("input.txt");
            #endif // ONLINE_JUDGE
        } else if (s != "__std__"){
            setIn(s + ".in");
            setOut(s + ".out");
        }
    }
}
 
using namespace IO;
 
namespace Function{
    template <typename T> T amx(T x){
        return x;
    }
    template <class T, class... Ts> T amx(T t, Ts... ts){
        return max(t, amx(ts...));
    }
    template <typename T> T amn(T x){
        return x;
    }
    template <class T, class... Ts> T amn(T t, Ts... ts){
        return min(t, amn(ts...));
    }
    template <class T, class... Ts> bool amax(T &a, Ts... b){
        T x = amx(b...);
        if (a < x){
            a = x;
            return 1;
        }
        return 0;
    }
    template <class T, class... Ts> bool amin(T &a, Ts... b){
        T x = amn(b...);
        if (a > x){
            a = x;
            return 1;
        }
        return 0;
    }
    template <typename T> void compress(T &a){
        sort(a.begin(), a.end());
        a.resize(unique(a.begin(), a.end()) - a.begin());
    }
    template <typename T> long long sqr(T x) {return 1LL * x * x;}
    template <typename T1, typename T2> long long GCD(T1 a, T2 b) {return b == 0 ? a : GCD(b, a % b);}
    template <typename T1, typename T2> long long LCM(T1 a, T2 b) {return 1LL * a / GCD(a, b) * b;}
}
 
using namespace Function;
 
namespace Output{
    string End_Of_Stream = "\n";
    void print(int x) {cout << x << End_Of_Stream;}
    void print(unsigned int x) {cout << x << End_Of_Stream;}
    void print(long unsigned int x) {cout << x << End_Of_Stream;}
    void print(long long x) {cout << x << End_Of_Stream;}
    void print(unsigned long long x) {cout << x << End_Of_Stream;}
    void print(float x) {cout << x << End_Of_Stream;}
    void print(double x) {cout << x << End_Of_Stream;}
    void print(long double x) {cout << x << End_Of_Stream;}
    void print(char x) {cout << x << End_Of_Stream;}
    void print(const char* x) {cout << x << End_Of_Stream;}
    void print(string x = "") {cout << x << End_Of_Stream;}
    void print(bool x) {cout << x << End_Of_Stream;}
 
    template <typename T1, typename T2> void print(pair <T1, T2> a) {cout << a.first << " " << a.second << End_Of_Stream;}
    template <size_t sz> void print(bitset<sz> a) {
        for(int i = 0; i < sz; i++){
            cout << a[i];
        }
        cout << End_Of_Stream;
    }
 
    template <typename T> void write(T x) {print(x);}
 
    template <class T, class... Ts> void write(T t, Ts... ts){
        write(t);
        write(ts...);
    }
 
    template <class T, class... Ts> void print(T t, Ts... ts){
        End_Of_Stream = " ";
        write(t, ts...);
        End_Of_Stream = "\n";
        print();
    }
 
    template <typename T> void print(T a){
        for(auto it : a){
            print(it);
        }
    }
 
    void prine(){
        print();
        exit(0);
    }
 
    template <class T, class... Ts> void prine(T t, Ts... ts){
        print(t, ts...);
        exit(0);
    }
}
 
using namespace Output;
 
typedef pair <int, int> pii;
 
const long long INFL = 1e18 + 1e15;
const int INF = 1e9 + 10;
const int N = 1e5 + 10;
 
int main(){
    setIO();

    

    return 0;
} 
