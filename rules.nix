# proxy = proxy the traffic through to the dest
# redirect = 302 redirect the traffic to the dest, passing the request_uri (the ?foobar portion of the URL) (you probably want this)
# permRedirect = 301 redirect to the dest
[
  {
    redirect = "admin.hackclub.com";
    dest = "https://hackclub.com/admin";
  }
  {
    proxy = "api.bulckcah.com";
    dest = "https://api.hackclub.com";
  }
  #{
  #  redirect = "board.hackclub.com";
  #  dest = "https://github.com/orgs/hackclub/projects/6";
  #}
  #{
  #  permRedirect = "camp-sheet.hackclub.com";
  #  dest =
  #    "https://docs.google.com/spreadsheets/d/1HCh5YtN_Y3JXbIMoiUdv-FgYiPZZD1kGg5QnfbsxiCw/edit";
  #}

  #{
  #  permRedirect = "camp.hackedu.us";
  #  dest = "https://hackclub.com/camp/";
  #}
  #{
  #  permRedirect = "camp.hackclub.io";
  #  dest = "https://hackclub.com/camp/";
  #}
  #{
  #  permRedirect = "camp.hackclub.com";
  #  dest = "https://hackclub.com/camp";
  #}

  #{
  #  redirect = "chicagohacks.hackclub.com";
  #  dest = "https://max68.typeform.com/to/IgeAc1";
  #}

  #{
  #  permRedirect = "clubs.hackedu.us";
  #  dest =
  #    "https://docs.google.com/spreadsheets/d/1Mb-8WBjiZUOYgWqNJxaigCWZvZqnIHZ2ZhokVNCbJ4g";
  #}
  #{
  #  permRedirect = "clubs.hackclub.io";
  #  dest =
  #    "https://docs.google.com/spreadsheets/d/1Mb-8WBjiZUOYgWqNJxaigCWZvZqnIHZ2ZhokVNCbJ4g";
  #}
  #{
  #  permRedirect = "clubs.hackclub.com";
  #  dest =
  #    "https://docs.google.com/spreadsheets/d/1Mb-8WBjiZUOYgWqNJxaigCWZvZqnIHZ2ZhokVNCbJ4g";
  #}

  #{
  #  redirect = "conduct.hackclub.com";
  #  dest = "https://hackclub.com/conduct/";
  #}
  #{
  #  redirect = "deals.hackclub.com";
  #  dest = "https://github.com/hackclub/deals";
  #}
  #{
  #  redirect = "demo-night.hackclub.com";
  #  dest =
  #    "https://www.eventbrite.com/e/hack-club-demo-night-tickets-26838356246";
  #}
  #{
  #  proxy = "design.hackclub.com";
  #  dest = "https://hackclub.github.io/design-system";
  #}
]
