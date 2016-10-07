# Challenge4
｢引数として渡された英数字をExcelの列名に変換､出力する｣  

```
引数が数値の場合  
例1: 引数 = 1 → A  
例2: 引数 = 27 → AA  
例3: 引数 = 2731 → DAA  

引数がローマ字の場合  
例1: 引数 = A → 1  
例2: 引数 = AA → 27  
例3: 引数 = DAA → 2731  
```

## 条件
言語､フレームワークはご自由に  
例外として､**Excel VBA､Google Apps Scriptは使用不可**とする  
引数としているが､入力フォームや､テキストファイルからの入力もOK  
引数は､数値､ローマ字のどちらが渡されても変換できるようにすること  

引数は､必ず以下の条件を満たすものとする｡  
数値の場合は**1~2147483647**までの自然数  
ローマ字の場合は**A~FXSHRXW**までの組合せ  

負数など､上記範囲外の値の考慮は不要  
但し､引数が渡されなかった場合の考慮はすること｡
※再度入力を促す､アプリケーションを終了するなど

## テストコードを書くこと
まず､必ず以下のようなメソッドないしは関数(以下メソッドで統一)を実装する｡   

```CSharp
//数値をExcelの列名(ローマ字)に変換
private string ConvertToColumnName(int columnNumber) {
    //なんらかの処理
    return "A"
}

//Excelの列名(ローマ字)を数値に変換
private int ConvertToColumnNumber(string columnName) {
    //なんらかの処理
    return 1
}
```
上記メソッドのテストコードを書くことを必須条件とする｡  
｢ユニットテストってどんなもんなんだろう｣というのを体験してもらいたいだけなので､｢とりあえず｣の実装で問題なし  
JavaならJUnit､.NetならNUnit等など...  
使用ツール等はご自由に  
余裕がある場合は､その他のメソッド(書いていれば)のテストコードも書いてみてください｡  

## 言語
Ruby 2.3.0 ※2.x系なら動くはず  
## テストに使用したツール､ライブラリ
RSpec 3.5.3  
## 使用方法

```
$ ruby main.rb -v 12345 #=> RFU
$ ruby main.rb -v RFU #=> 12345
```
## テスト
RSpecをインストールしていない場合は以下を実行  
`$ gem install rspec`  

テストの実行  
`$ rspec test_case.rb`  

テスト結果  
![challenge4_test_results](https://github.com/KeisukeKudo/ImageStorage/blob/master/challenge4_test_results.png)
