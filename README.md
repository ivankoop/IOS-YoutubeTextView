# IOS-YoutubeTextView
IOS TextView with Youtube Iframe

This is a simple textView that supports youtube iframe.

Instead of a webview it creates an thumbnail of the youtube video with a link of the video that redirects to youtube
app or the default browser.

# How to use
you have to enable links on your textView for this to work.

```swift
  let your_html_text = "<p><iframe style="border: 0;" src="https://www.google.com/maps/embed?pb=!1m0!4v1502281919281!6m8!1m7!1sF%3A-jJjrPj6V6DA%2FWYr_8h5VVtI%2FAAAAAAAAi_w%2FDvzODSmN_xg1KPunXhNX3DLyxbocMukWwCLIBGAYYCw!2m2!1d-25.3001111!2d-57.63762879999999!3f182.48390136921398!4f0.5969060800483703!5f0.7820865974627469" width="600" height="600" frameborder="0" allowfullscreen="allowfullscreen"></iframe></p>";
  
  YoutubeTextView.setText(text: your_html_text);
```

# License

```
MIT License

Copyright (c) 2017 Ivan Koop

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

```
