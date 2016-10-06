require 'optparse'
require './excel_column_converter'

#引数の取得
#@return [Array[String]] 起動時の引数連想配列
def startup_argument
    argument = {}
    OptionParser.new do |parser|
        parser.on('-v [VALUE]', '変換値(必須)') { |v| argument[:value] = v }
        parser.parse!(ARGV)
    end

    argument
end

argument = startup_argument
value = argument[:value]

#引数が取得できない場合はメッセージを出力して終了
if value.nil? || value.empty?
    puts '引数に "-v {VALUE}"を指定してください'
    exit
end

puts ConvertExcelClolumn.new.column_conversion(value)