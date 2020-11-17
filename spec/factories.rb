FactoryBot.define do
  factory :assignment do

  end

  factory :course do

  end


  factory :user do

  end

  factory :random_course, class: Course do
    name { Faker::Lorem.name }
    id { Faker::Number.between(1, 1000) }
    #question { Faker::Lorem.question }
    #answer { Faker::Lorem.sentence }
    #service { service_array.sample }
    #number { Faker::Number.between(1, 2) }
    #letter { letter.sample }
  end

  factory :random_assignment, class: Assignment do
    name { Faker::Lorem.name }
    id { Faker::Number.between(1, 1000) }
    course_id { Faker::Number.between(1, 2) }
  end

  factory :random_user, class: User do
    username { Faker::Lorem.name }
    id { Faker::Number.between(1, 100) }
    fullname { Faker::Lorem.name }
    dateOfBirth { Faker::Date.backward(days: 14) }

  end

  factory :random_teacher, class: Teacher do
    id { Faker::Number.between(1, 1000) }
    user_id { Faker::Number.between(1, 100) }
    levelNo { Faker::Number.between(1, 100) }
  end

  factory :random_student, class: Student do
    id { Faker::Number.between(1, 1000) }
    user_id { Faker::Number.between(1, 1000) }
    classNo { Faker::Number.between(1, 1000) }
  end
end
