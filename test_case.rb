require './excel_column_converter'

#privateメソッドはclass#send(:method_name, arg[])で呼ぶ
#参考: http://bicycle.life.coocan.jp/takamints/index.php/techtips/xlsColNumMap
describe ConvertExcelClolumn do
    let(:convert) { ConvertExcelClolumn.new }

    describe '#to_column_number' do
        it 'Aが1になること(最小値)' do
            expect(convert.send(:to_column_number, 'A')).to eq '1'         
        end

        it 'FXSHRXWが2147483647になること(最大値)' do
            expect(convert.send(:to_column_number, 'FXSHRXW')).to eq '2147483647'         
        end

        it 'AAZAが18929になること' do
            expect(convert.send(:to_column_number, 'AAZA')).to eq '18929'         
        end

        it 'FIZZが112242になること' do
            expect(convert.send(:to_column_number, 'FIZZ')).to eq '112242'         
        end

        it 'BUZZが50050になること' do
            expect(convert.send(:to_column_number, 'BUZZ')).to eq '50050'         
        end

        it '空文字がnilになること' do
            expect(convert.send(:to_column_number, '')).to eq nil         
        end

        it '引数がない場合にArgumentErrorが発生すること' do
            expect { convert.send(:to_column_number) }.to raise_error(ArgumentError)
        end

        it '引数がnilの場合にNoMethodErrorが発生すること' do
            expect { convert.send(:to_column_number, nil) }.to raise_error(NoMethodError)
        end
    end
end

describe ConvertExcelClolumn do
    let(:convert) { ConvertExcelClolumn.new }

    describe '#to_column_name' do
        it '1がAになること(最小値))' do
            expect(convert.send(:to_column_name, 1)).to eq 'A'         
        end

        it '2147483647がFXSHRXWになること(最大値))' do
            expect(convert.send(:to_column_name, 2147483647)).to eq 'FXSHRXW'         
        end

        it '18929がAAZAになること' do
            expect(convert.send(:to_column_name, 18929)).to eq 'AAZA'         
        end

        it '112242がFIZZになること' do
            expect(convert.send(:to_column_name, 112242)).to eq 'FIZZ'         
        end

        it '50050がBUZZになること' do
            expect(convert.send(:to_column_name, 50050)).to eq 'BUZZ'         
        end

        it '0がnilになること' do
            expect(convert.send(:to_column_name, 0)).to eq nil         
        end

        it '引数がない場合にArgumentErrorが発生すること' do
            expect { convert.send(:to_column_name) }.to raise_error(ArgumentError)
        end

        it '引数がnilの場合にNoMethodErrorが発生すること' do
            expect { convert.send(:to_column_name, nil) }.to raise_error(NoMethodError)
        end
    end
end