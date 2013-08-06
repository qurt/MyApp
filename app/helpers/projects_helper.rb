module ProjectsHelper
	def TaskCount(project_id)
		count = Project.find_by_id(project_id).tasks.count
		count
	end
	def inactiveTaskCount(project_id)
		count = Project.find_by_id(project_id).tasks.find_all_by_active(false).count
		count
	end
end