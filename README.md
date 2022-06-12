#### Potential attack vectors

* API injection attacks
* DDoS Attack : there is no mechanism to restrict IPs from sending data continuously disrupting traffic
* Spam : don't implement API key, to protect from the spammers


#### What scalability issues

* We can implement a new API (API v2) without affecting the old users using API v1

#### How to install

* Please read `README-INSTALL.md`

#### Endpoints
* Encode(method: POST)
```html
https://ngocnt-shorturl.herokuapp.com/api/v1/encode
```

* Parameters
```html
{
  original_url: 'https://www.google.com/'
}
```

* Decode(method: GET)
```html
https://ngocnt-shorturl.herokuapp.com/api/v1/decode
```

* Parameters
```html
{
  token: 'ikWYAzAU'
}
```