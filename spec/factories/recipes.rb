FactoryBot.define do
  factory :recipe do
    sequence(:title) { |n| "Title#{n}" }
    prep_time 30
    cook_time 20
    instructions "Lorem ipsum dolor sit amet, vel suscipit, vestibulum velit sed fusce velit rutrum, porta vel. Sit vel gravida, interdum sociosqu pellentesque. Dignissim odio mattis nunc et cursus aliquam, tempus nihil eos sed, faucibus morbi quis fermentum nullam orci, bibendum sed est lacinia nulla velit lectus. Urna vulputate vel porta nunc mauris, nec suscipit morbi, turpis vel est varius a, aliquam lacus erat elit urna convallis nulla, rhoncus amet ut luctus quis natoque tortor. Quis vestibulum tempus lorem eros nec praesent. Curabitur quis condimentum tincidunt nibh sit, nunc risus tempor tellus do diam eget, a mauris id nulla, enim suscipit. Mauris ac lobortis tempor pede senectus. Massa neque, est non scelerisque tellus massa libero wisi, iaculis nullam fusce aptent fermentum tellus, libero cras sed. Suscipit dolor, in proin dui phasellus, tellus sed morbi, amet consectetuer, hendrerit est faucibus vitae diam sit dolor."
    photo '/Users/jamesnelson/turing/personal_projects/recipes_and_lists/app/assets/images/spilled_milk.png'
  end
end
