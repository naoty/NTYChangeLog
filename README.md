# NTYChangeLog

```markdown
# Change Log

## 1.0.1

### Change
* Change the name of this rubygem. [#3](https://github.com/naoty/nty_change_log/pull/3)
* Divide a large methods into some small methods. [#3](https://github.com/naoty/nty_change_log/pull/3)

### Fix
* Fix some bugs. [#3](https://github.com/naoty/nty_change_log/pull/3)

## 1.0.0

### Add
* Parse change groups. [#2](https://github.com/naoty/nty_change_log/pull/2)
* Parse change logs in my style. [#1](https://github.com/naoty/nty_change_log/pull/1)
```

## Usage

```ruby
require "nty_change_log"

text = File.read("./CHANGELOG.md")
change_log = NTYChangeLog::Parser.new.parse(text)

version = change_log.versions.first
version.number #=> "1.0.1"

change_group = version.change_groups.first
change_group.label #=> "Change"

change = change_group.changes.first
change.description #=> "Change the name of this rubygem."
change.issue.number #=> 3
change.issue.url #=> "https://github.com/naoty/nty_change_log/pull/3"
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
