#引数の英数字をExcelの列名or列番号に変換､出力する
class ConvertExcelClolumn

    #引数をExcelの列名or列番号に変換する
    #@param [String] target 変換対象の英数字
    #@return [String] 引数が数値の場合 例1: 引数 = 1 → A, 例2: 引数 = 27 → AA, 例3: 引数 = 2731 → DAA
    #@return [String] 引数がローマ字の場合 例1: 引数 = A → 1, 例2: 引数 = AA → 27, 例3: 引数 = DAA → 2731
    def column_conversion(target)
        target.number? ? to_column_name(target.to_i) : to_column_number(target)
    end

    private

    #英字で構成されている場合は数値で返す
    #@param [String] target 変換対象の英字
    #@return [String] Excel列番号
    def to_column_number(target)
        target = target.upcase.reverse

        result = 0
        for i in 0..target.size - 1
            #大文字英字のcharコードが65から始まるので64を引く ※参考URL: http://www3.nit.ac.jp/~tamura/ex2/ascii.html
            #その値に26(A~Zの数)のi乗した値を掛けて結果用変数へ加算する
            result += (target[i].ord - 64) * (26 ** i)
        end

        result != 0 ? result.to_s : nil
    end

    #数値で構成されている場合はA~Zの組合せで返す
    #@param [Integer] target 変換対象の数値
    #@return [String] Excel列名
    def to_column_name(target)
        result = ''
        while target != 0
            #↓で65を加算する関係で､A = 0としたいので-1する
            target -= 1

            #対象の数値/26の余りを算出し､65を加算､UTF-8な文字に変換
            #余り0 + 65 = A(char: 65)
            result += (target % 26 + 65).chr('UTF-8')

            #勝手に切捨ててくれるので小数は気にしない
            target /= 26
        end

        !result.empty? ? result.reverse : nil
    end
end

#オープンクラスしてStringにnumber?メソッドを追加
class String

    #数値で構成されている文字列か
    #@return [Boolean] 数値で構成されている場合はtrue
    def number?() self =~ /\d+/ end

end