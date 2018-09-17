TASKS = [
  "Test VR intro video",
  "Email machine learning group",
  "Purchase ticket to Brazil",
  "Finish Unit 7 of Portuguese Lessons",
  "Purchase monitors for Rio team"
]

class TasksController < ApplicationController
  def index
    @tasks = TASKS
  end
end
