set -euo pipefail
set -x

MY_L=$(git ls-remote --refs https://github.com/bo2013/builds.git 'refs/heads/gcc-*' | awk -F'/' '{print $NF}' | sort -V | tail -1)
GCC_L=$(git ls-remote --refs https://gcc.gnu.org/git/gcc.git 'refs/heads/releases/gcc-*' | awk -F'/' '{print $NF}' | sort -V | tail -1)
MOD=false

if [ "$MY_L" != "$GCC_L" ]; then
    echo "New version: $GCC_L ≠ $MY_L"
    
else
    echo "up-to-date: $MY_L"
fi