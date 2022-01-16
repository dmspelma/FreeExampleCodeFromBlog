def countDigit(num)
	return 1 if num == 0
	return Math.log(num.abs, 10).round(14).floor + 1
end

def getDigit(num, index)
	stringNum = num.abs.to_s
	currentIndex = stringNum.length - 1 - index
	return stringNum[currentIndex] && currentIndex >= 0 ? stringNum[currentIndex].to_i : 0
end

def maxDigit(array)
	maxNum = 0

	array.each_with_index do |num, i|
		maxNum = [maxNum, countDigit(num)].max
	end

	return maxNum
end

def radixSort(array)
	maxDigitLength = maxDigit(array)

	maxDigitLength.times do |i|

		bucketArray = Array.new(10)

		array.length.times do |j|
			lastDigit = getDigit(array[j], i)
			bucketArray[lastDigit] ||= []
			bucketArray[lastDigit] << array[j]
		end

		array = bucketArray.compact.flatten
	end

	return array
end


a = [2,1,10,199,9000,44,69,201,1000,100001,4]
b = [2,1,10,199,44,69,201,4,76,4,99,9,32,33,23,87,420,69]
c = [102,199,325,711,240,669]
p radixSort(a)
p radixSort(b)
p radixSort(c)


