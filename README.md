BEFORE SHIPPING:

- set Host to the hostname of the URL we're wanting to proxy to. this will fix github pages domains that have a CNAME, like maxwofford.com
- automatic test and deploy via github actions
- good readme with instructions a non-nix user can understand

todo:

- proxy pass maxwofford.com is broken

future:

- allow array entries in redirect, permRedirect, and proxy. ex: redirect: [ "camp.hackclub.com", "camp.hackedu.us", etc]
- consider having an automatic redirect for root domains to hackclub.com. right now you need to manually specify that hackedu.us redirects to hackclub.com

refactor:

- specify all configuration in rules.nix, like the default redirect location (look into modules pattern?)
