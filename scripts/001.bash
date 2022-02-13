#!/bin/bash

# bc: 計算する
echo 1+1 | bc # 2
echo 'foo' | bc # 0

# >: リダイレクト
echo '1+1' | bc > a; cat a

# rmdir: ディレクトリ削除
echo あいうえお > a;mkdir tmp;mv a ./tmp/;rm ./tmp/a;rmdir ./tmp;ls -l

# pwd: print working directory
pwd;cd ..;pwd;cd -;pwd

# chmod -r
touch a;chmod -r a;ls -l a;cat a;rm -f a
#--w-------  1 otajisan  staff  0  2 13 19:35 a
#cat: a: Permission denied

## パーミッションの読み方
# r: read
# w: write
# x: execute

# chmod +r
echo 'foo' > a;chmod +r a;ls -l a;cat a;rm -f a
#-rw-r--r--  1 otajisan  staff  4  2 13 19:41 a
#foo

# -: 不許可
# +: 許可

## -rwxr-xr-x <- これ
# 最初の3桁: ファイルの所有者
# 次の3桁: ファイルの所有グループ
# 最後の3桁: 所有者、所有グループ以外

## manの日本語化
#sudo apt update
#sudo apt install manpages-ja
#sudo apt install manpages-ja-dev
#sudo apt install language-pack-ja
#sudo update-locale LANG=ja_JP.UTF-8

# grep -A <row count>: マッチ行の次のn行も表示
echo 'foo\nbar' > a;cat a | grep -A 1 'foo';rm -f a
#foo
#bar

# sed系
echo クロロエチルエチルエーテル | sed 's/エチル/メチル/'
#クロロメチルエチルエーテル

# &: 検索対象文字列を再利用
echo クロロエチルエーテル | sed 's/エチル/&&/'
#クロロエチルエチルエーテル (&が2つなので2個繰り返し再利用)

# -E: 拡張正規表現を利用する
# \数字: 後方参照
echo クロロメチルエチルエーテル | sed -E 's/(メチル)(エチル)/\2\1/'
#クロロエチルメチルエーテル

# -Eが無い場合の表現(括弧をエスケープする必要アリ)
echo クロロメチルエチルエーテル | sed 's/\(メチル\)\(エチル\)/\2\1/'
#クロロエチルメチルエーテル

# seq: シーケンシャルな番号
# xargs: 標準出力の結果を横並びに
seq 100 | grep 0 | xargs
#10 20 30 40 50 60 70 80 90 100

# -o, --only-matching
#        Prints only the matching part of the lines.
echo '中村 山田 田代 上田' | grep -o '[^ ]田'
#山田
#上田
