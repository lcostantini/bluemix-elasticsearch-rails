namespace :posts do
  desc 'Create multiples posts to search.'
  task :seed => :environment do
    Post.destroy_all

    @sample_words = IO.readlines('sample-words.txt')

    1000.times do |i|
      print '.'
      Post.create title: '#' + i.to_s + ' ' + random_words(2).capitalize,
                  body: random_words(20)
    end
  end

  desc 'Create ES index.'
  task :create_index => :environment do
    Post.__elasticsearch__.create_index!
    print 'OK! - Index created'
  end
end

def random_words number
  random_words = []
  number.times { random_words << @sample_words[random_line].chomp }
  random_words.join(" ")
end

def random_line
  (0...69897).to_a.sample
end
