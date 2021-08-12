# OSint Stuff

### copy images of webpage 

```bash
wget -nd -H -p -A jpg,jpeg,png,gif -e robots=off
```
### Check geolocation tags on images.

```bash
exiftool -filename -gpslatitude -gpslogitude -T ../test > out.txt
```
