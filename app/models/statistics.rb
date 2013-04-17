	class Array
		def z_score(score)
			(score - avg)/std_dev
		end

		def avg
			self.inject(:+)/self.size
		end

		def std_dev
			self.map{|r| r - self.avg}.map(&:squared).avg.sqrt
		end
	end

	class BigDecimal
		def squared
			self.**2
		end

		def sqrt
			Math.sqrt(self)
		end
	end

	class Float
		def squared
			self.**2
		end

		def sqrt
			Math.sqrt(self)
		end
	end
