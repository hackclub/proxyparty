# proxy server + NixOS = proxyparty!

Ever need to redirect one URL to another? Ever need to proxy a website to a different domain? Hate manually configuring nginx?

This is Hack Club's proxy server, which we rely on to make sure our old links keep working, that certain domains are proxied to different domains to get around school filters, and that any needed redirects are easy to set up and manage.

Here's how it works:

1. Open up `rules.nix` and add a new rule to either redirect, permanently redirect, or proxy one URL to another
2. Make sure the domain you want to redirect from / proxy to points to `proxy.servers.hackclub.com` (most Hack Club domains have a subdomain wildcard that points to this server)
2. Submit a pull request with your changes

And that's it! Once your pull request is merged, a new nginx configuration with your changes is automatically generated, and the server at `proxy.servers.hackclub.com` is automatically updated using GitHub Actions.

It's almost like magic, thanks to the power of NixOS!

## License

proxyparty is licensed under the [MIT License](LICENSE.md)!
