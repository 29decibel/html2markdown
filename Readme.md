### Simple html to Markdown ruby gem [![Code Climate](https://codeclimate.com/github/29decibel/html2markdown.png)](https://codeclimate.com/github/29decibel/html2markdown)
We love markdown, cause it is friendly to edit.
So we want everything to be **markdown**

### RSpec is our promise
```ruby
p = HTMLPage.new :contents => '<strong>haha</strong>'
p.markdown.should == '**haha**'
p.contents = '<strong>hehe</strong>'
p.markdown!.should == '**hehe**'

# you can also define your own node parse
p.strong do |node,contents|
  "strong text : **#{contents}**"
end
p.markdown!.should be_include('strong text')
```

### Installation
* gem

```ruby
gem install html2markdown
```

* Rails Gemfile

```ruby
gem 'html2markdown'
```

### CLI usage

```shell
html2markdown [file]
```

The command line tool with print the markdown to stdout. You can then redirect to a file.

Ex.

```shell
html2markdown index.html > index.md
```
