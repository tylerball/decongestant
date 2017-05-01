# decongestant ![build](https://travis-ci.org/tylerball/decongestant.svg?branch=master)

Compile assets from sprockets to files easily.

In your Rakefile:

```ruby
require 'decongestant'

Decongestant::Task.new do |t|
  t.output = './tmp'
  t.assets = %w(application.css)
end
```

then:

```sh
$ bin/rake decongestant:compile
```

Tada!

```sh
$ tree tmp
tmp
├── application.css
└── application.css.gz

0 directories, 2 files
```

That's it.
