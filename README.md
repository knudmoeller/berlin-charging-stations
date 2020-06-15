A simple makefile and Ruby script to download a GML-file with charging stations in Berlin from a WFS-Service (see https://energieatlas.berlin.de) and transform it into CSV.

## Output

The output CSV-file lives in:

* raw: [data/target/elektro-ladesäulen-berlin.csv](data/target/elektro-ladesäulen-berlin.csv)
* github's CSV-viewer: [elektro-ladesäulen-berlin.csv](https://github.com/knudmoeller/berlin-charging-stations/blob/master/data/target/elektro-ladesäulen-berlin.csv)

## Requirements

* Ruby
* the Nokogiri gem

## Running

```
$ make data
downloading data/temp/elektro-ladesäulen.xml from WFS service
writing to data/temp/elektro-ladesäulen.xml ...
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  548k    0  548k    0     0   778k      0 --:--:-- --:--:-- --:--:--  778k

formatting data/temp/elektro-ladesäulen.xml
writing to data/temp/elektro-ladesäulen_formatted.xml ...
converting data/temp/elektro-ladesäulen_formatted.xml to CSV
writing to data/target/elektro-ladesäulen-berlin.csv ...
$
```

## License

All software in this repository is published under the [MIT License](LICENSE).

---

2020, Knud Möller
[https://github.com/knudmoeller/berlin-charging-stations](https://github.com/knudmoeller/berlin-charging-stations)

Last changed: 2020-06-15
