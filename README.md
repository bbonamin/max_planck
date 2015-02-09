# MaxPlanck

Calculate the maximum rectangle that can be cut out of a plank
with holes.

## Installation
Requires Ruby 2.1+
Add this line to your application's Gemfile:

```
git clone https://github.com/bbonamin/max_planck
cd max_planck
rake build
gem install pkg/max_planck-0.0.1.gem
```

## Usage

```
$ max_planck path/to/file/with/specs.txt
```

where `path/to/file/with/specs.txt` must point to a text file with the following format:
```
PLANK_WIDTH PLANK_HEIGHT
NUMBER_OF_HOLES
HOLE_1_X HOLE_1_Y
HOLE_2_X HOLE_2_Y
HOLE_3_X HOLE_3_Y
...
```

## Contributing

1. Fork it ( https://github.com/bbonamin/max_planck/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
