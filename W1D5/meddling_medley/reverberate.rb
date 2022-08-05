=begin
reverberate
Write a method reverberate that accepts a sentence as an argument. The method should translate the sentence according to the following rules:

words that are shorter than 3 characters are unchanged
words that are 3 characters or longer are translated according to the following rules:
if the word ends with a vowel, simply repeat the word twice (example: 'like'->'likelike')
if the word ends with a non-vowel, repeat all letters that come after the word's last vowel, including the last vowel itself (example: 'trash'->'trashash') 
Note that if words are capitalized in the original sentence, they should remain capitalized in the translated sentence. Vowels are the letters a, e, i, o, u.
=end

def reverberate(sent)
  new_sentence = []
  vowels = "aeiouAEIOU"
  sent.split(" ").each do |word|
    if word.length < 3
        new_sentence << word
        next
    elsif vowels.include?(word[-1])
        if word[0] == word[0].upcase
            new_sentence << word.capitalize + word
            next
        else
            new_sentence << word + word
            next
        end
        next
    else
        i = word.length-1
        i.downto(0).each do |i|
            if vowels.include?(word[i])
                if word[0] == word[0].upcase
                    new_sentence << (word + word[i..-1]).capitalize
                    break
                else
                   new_sentence << (word + word[i..-1]).downcase
                end
                break
            end
        end
    end
  end
  new_sentence.join(" ")
end

p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"