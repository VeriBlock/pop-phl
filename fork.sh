mv /src/vbk ..
find . -type f -print0 | xargs -0 dos2unix
find . \( -type d -name .git -prune \) -o -type f -print0 | xargs -0 sed -i 's/vbitcoin/placeh/g'
find . \( -type d -name .git -prune \) -o -type f -print0 | xargs -0 sed -i 's/bitcoin/placeh/g'
find . \( -type d -name .git -prune \) -o -type f -print0 | xargs -0 sed -i 's/BITCOIN/PLACEH/g'
find . \( -type d -name .git -prune \) -o -type f -print0 | xargs -0 sed -i 's/VBTC/PHL/g'
find . \( -type d -name .git -prune \) -o -type f -print0 | xargs -0 sed -i 's/BTC/PHL/g'
find . \( -type d -name .git -prune \) -o -type f -print0 | xargs -0 sed -i 's/vBitcoin/Placeholders/g'
find . \( -type d -name .git -prune \) -o -type f -print0 | xargs -0 sed -i 's/Bitcoin/Placeholders/g'
find . \( -type d -name .git -prune \) -o -type f -print0 | xargs -0 sed -i 's/setPHL/setBTC/g'
find . \( -type d -name .git -prune \) -o -type f -print0 | xargs -0 sed -i 's/last_known_placeh/last_known_bitcoin/g'

find . \( -type d -name .git -prune \) -o -type f -print0 | xargs -0 rename 's/bitcoin/placeh/' *.ts
find . \( -type d -name .git -prune \) -o -type f -print0 | xargs -0 rename 's/bitcoin/placeh/' *.*


manually go into msvc


mv ../vbk ./src/

mv ../vbk ./src/

