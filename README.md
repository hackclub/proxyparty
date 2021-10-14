BEFORE SHIPPING:

- fix bulckcah hanging
- set Host to the hostname of the URL we're wanting to proxy to. this will fix github pages domains that have a CNAME, like maxwofford.com
- automatic deploy via github actions
- good readme with instructions a non-nix user can understand

todo:

- bulckcah is broken
- proxy pass maxwofford.com is broken

testing / todo:

- test bulckcah with simpler nginx config
- test api.bulckah (config varies)

update reference to proxy on hackedu.us, hackclub.io, and hackclub.com

future:

- allow array entries in redirect, permRedirect, and proxy. ex: redirect: [ "camp.hackclub.com", "camp.hackedu.us", etc]
