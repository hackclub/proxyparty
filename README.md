# proxy server + NixOS = proxyparty!

<img src="https://cloud-j2qw0ldis-hack-club-bot.vercel.app/00img_0098.jpg" width="250" alt="You've found a pass to the proxy party!" align="right" />

Ever need to redirect one URL to another? Ever need to proxy a website to a different domain? Hate manually configuring nginx?

This is Hack Club's proxy server, which we rely on to make sure our old links keep working, that certain domains are proxied to different domains to get around school filters, and that any needed redirects are easy to set up and manage.

Here's how it works:

1. Open up `rules.nix` and add a new rule to either redirect, permanently redirect, or proxy one URL to another
2. Make sure the domain you want to redirect from / proxy to points to `proxyparty.hackclub.com` (most Hack Club domains have a subdomain wildcard that points to this server)
3. Submit a pull request with your changes

<img src="https://cloud-e428gpdi3-hack-club-bot.vercel.app/0img_0099.jpg" width="100" alt="Orpheus at a proxy party admissions booth" align="left" />

And that's it! Once your pull request is merged, a new nginx configuration with your changes is automatically generated, and the server at `proxyparty.hackclub.com` is automatically updated using GitHub Actions.

It’ll even get an SSL certificate if one doesn’t already exist for the domain, and automatically renew any SSL certificates when it’s time.

It's almost like magic, thanks to the power of NixOS!

## License

proxyparty is licensed under the [MIT License](LICENSE.md)!
