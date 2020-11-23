


class CustomConsumerConsumer < Racecar::Consumer
  subscribes_to "courses"

  def process(message)
    puts "Received message: #{message.value}"
    course = Course.new()
    params = JSON.parse(message.value)
    course.name = params['name']
    course.teacher_id = params['teacher_id']
    #debugger
    puts "Received course: #{course}"

    course.save!
    #debugger
    #if course.save!
        #flash[:success] = "Course Successfully saved"
  #      redirect_to courses_list_url
  #  else
        #flash[:danger] = "Course Not saved due to empty name"
  #      render 'new'
  #  end
    # DEBUG:
    #user = User.find(data["user_id"])
    #user.banned = true
    #user.save!
  end
end
