require 'optparse'
require 'pokemon'
require 'types'

def parse_options
  ARGV << '-h' if ARGV.empty?

  options = {}

  OptionParser.new do |opts|
    opts.banner = 'How to: ruby weather.rb [options]'

    opts.on('-p', '--pokemon ID') do |id|
      options['id'] = digits
    end

    opts.on('-h', '--help') do
      puts opts
      exit
    end
  end.parse!

  options
end

def main
  options = parse_options

  id = options['id']

  pokemon = Pokemon.new(id)

  pokemon.check

end

main if __FILE__ == $PROGRAM_NAME
