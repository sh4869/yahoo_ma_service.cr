# yahoo_ma_service.cr

Yahoo Japanese Morphological analysis Service API Wrapper for Crystal.

[テキスト解析:日本語形態素解析 - Yahoo!デベロッパーネットワーク](http://developer.yahoo.co.jp/webapi/jlp/ma/v1/parse.html)

## Installation


Add this to your application's `shard.yml`:

```yaml
dependencies:
  yahoo_ma_service:
    github: sh4869/yahoo_ma_service.cr
```


## Usage


```crystal
require "yahoo_ma_service"

yahoo_client = YahooMAService::MAServiceClient.new("YOUR-YAHOO-APP-ID")
result = yahoo_client.parse("庭には２羽鶏がいる")
result.word_list.each { |word| puts word.surface }
```


## TODO

* Write Test #from_xml_node 
* Support uniq_result 
* Support option parameter


## Contributing

1. Fork it ( https://github.com/sh4869/yahoo_ma_service/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [sh4869](https://github.com/sh4869) sh4869 - creator, maintainer
