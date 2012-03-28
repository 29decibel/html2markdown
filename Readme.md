### Yet Another Html to Markdown ruby lib
We love markdown, cause it is friendly to edit.
So we want everything to be markdown

### spec is our promise
```ruby
p = HTMLPage.new :contents => '<strong>haha</strong>'
p.markdown.should == '**haha**'
p.contents = '<strong>hehe</strong>'
p.markdown!.should == '**hehe**'
```
