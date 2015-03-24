FactoryGirl.define do
  factory(:user) do
    name('example name')
    password('password')
    password_confirmation('password')
  end
  factory(:question) do
    question('example question')
  end

  factory(:answer) do
    answer('example answer')
  end
end
