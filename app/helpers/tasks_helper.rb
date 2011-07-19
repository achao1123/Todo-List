module TasksHelper
	def priority_to_s(int)
		case int
		when 0
			'High'
		when 1
			'Medium'
		when 2
			'Low'
		end
	end
end
