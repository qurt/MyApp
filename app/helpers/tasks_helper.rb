module TasksHelper
	def getSelectProjectList
		result = Project.all.map { |project| [project.name, project.id] }
		result	
	end
end
