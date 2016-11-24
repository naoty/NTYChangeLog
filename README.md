# n_change_log

## Usage

```ruby
require "n_change_log"

text = File.read("./CHANGELOG.md")
change_log = NChangeLog::Parser.new.parse(text)
```

## Example

This parses texts like following.

```markdown
# Change Log

## 1.0.1

### [#3](https://github.com/naoty/n_change_log/pull/3)

#### Change
* Change the name of this rubygem.
* Divide a large methods into some small methods.

#### Fix
* Fix some bugs.

## 1.0.0

### [#2](https://github.com/naoty/n_change_log/pull/2)

#### Add
* Parse change groups.

### [#1](https://github.com/naoty/n_change_log/pull/1)

#### Add
* Parse change logs in my style.
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

