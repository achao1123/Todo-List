class Task < ActiveRecord::Base

  belongs_to :user
	
	validates_presence_of :title
	validates_presence_of :priority

	PRIORITIES = {
		'High' => 0,
		'Medium' => 1,
		'Low' => 2
	}
	
end
