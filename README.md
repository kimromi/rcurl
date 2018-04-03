# Rcurl

Simple curl command wrapper

## Installation

    $ gem install rcurl

## Usage

### GET

Create example.yaml

```yaml
method: GET
params:
  hoge: fuga
```

execute `rcurl` command with option `-d`

```console
$ rcurl -d @path/to/example.yaml http://example.com

# => curl -sS -X GET http://example.com?hoge=fuga
```

### POST (application/x-www-form-urlencoded)

example.yaml

```yaml
method: POST
params:
  hoge: fuga
```

```console
$ rcurl -d @path/to/example.yaml http://example.com

# => curl -sS -X POST -d 'hoge=fuga' http://example.com
```

### POST (application/json)

example.yaml

```yaml
method: POST
headers:
  - 'Content-type: application/json'
params:
  hoge: fuga
```

```console
$ rcurl -d @path/to/example.yaml http://example.com

# => curl -sS -X POST -H 'Content-type: application/json' -d '{"hoge":"fuga"}' http://example.com
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kimromi/rcurl.
