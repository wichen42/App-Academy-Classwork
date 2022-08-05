def all_words_capitalized?(arr) # return true if all words are capitalized : use Array#all?
  arr.all? {|word| word == word.capitalize}
end

def no_valid_url?(arr) # valid url ends in .com, .net, .io, .org : use Array#none?
  arr.none? {|url| url.include?(".com") || url.include?(".io") || url.include?(".net") || url.include?(".org")}
end

def any_passing_students?(arr) # true if any student grade >= 75 : use Array#any?
  arr.any? do |hash| 
    avg = (hash[:grades].inject {|acc, ele| acc + ele}) / hash[:grades].length
    avg > 75  
  end
end
students = [
    { name: "Alvin", grades: [70, 50, 75] },
    { name: "Warlin", grades: [80, 99, 95] },
    { name: "Vlad", grades: [100] },
  ]
p any_passing_students?(students)

students_2 = [
    { name: "Alice", grades: [94, 96] },
    { name: "Bob", grades: [50, 60] }
  ]

p any_passing_students?(students_2)

students_3 = [
    { name: "Alice", grades: [60, 68] },
    { name: "Bob", grades: [20, 100] }
  ]

p any_passing_students?(students_3)