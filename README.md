# Mio Says: Anime caption generator!
generates captions using random bubbles, random images, and piped in text

```fortune -s | ./mioSays.sh test.png```
![Examples](https://u.teknik.io/8Wekr.png)

# Filename Encodings
The bubble images are encoded with three geometries 
example: 189x482;+79+71;487
* size of text box
* offset geometry for textbox from top left
* height offset for tail from top

The avatar images are encoded with one geometry 
example: 214
* height offset of mouth from top
