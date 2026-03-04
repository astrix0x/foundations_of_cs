# Task 1 - Encoding Formats Demo

import base64
import urllib.parse

# Base64 Encoding
message = "Hello World"
encoded = base64.b64encode(message.encode())
decoded = base64.b64decode(encoded).decode()

print("Base64 Encoding")
print("-" * 30)
print("Original:", message)
print("Encoded:", encoded)
print("Decoded:", decoded)

# URL Encoding
url = "www.youtube.com hello&nice-/to meet you "
url_encoded = urllib.parse.quote(url)
url_decoded = urllib.parse.unquote(url_encoded)

print("\nURL Encoding")
print("-" * 30)
print("Original:", url)
print("Encoded:", url_encoded)
print("Decoded:", url_decoded)