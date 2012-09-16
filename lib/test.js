https://api.weibo.com/oauth2/authorize?client_id=YOUR_CLIENT_ID&response_type=code&redirect_uri=YOUR_REGISTERED_REDIRECT_URI


2. 如果用户同意授权,页面跳转至 YOUR_REGISTERED_REDIRECT_URI/?code=CODE


3. 换取Access Token

https://api.weibo.com/oauth2/access_token?client_id=YOUR_CLIENT_ID&client_secret=YOUR_CLIENT_SECRET&grant_type=authorization_code&redirect_uri=YOUR_REGISTERED_REDIRECT_URI&code=CODE

（其中client_id=YOUR_CLIENT_ID&client_secret=YOUR_CLIENT_SECRET可以使用basic方式加入header中）


