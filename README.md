# decongestant
Compile assets from sprockets to files easily.

```ruby
require 'decongestant'

Decongestant::Task.new do |t|
  t.output = './tmp'
  t.assets = %w(application.css)
end
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
