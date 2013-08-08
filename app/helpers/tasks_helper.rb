module TasksHelper
	def getSelectProjectList
		result = Project.all.map { |project| [project.name, project.id] }
		result	
	end
  def getSelectUsersList
    result = User.all.map { |user| [user.name, user.id] }
    result
  end
end
