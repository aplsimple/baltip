# LAST CHANGES:


Version `1.4.1 (14 Sep'22)`

  - NEW   : for a widget: baltip::configure w -opt val ?-opt val?
  - NEW   : for a widget: baltip::cget w -opt
  - CHANGE: -pause option: default 1000 (1sec.) instead of 600


Version `1.4.0 (24 Jul'22)`

  - CHANGE: %t wildcard of -command option needs no outer {}
  - CHANGE: baltip::hide: no need to call *Command*


Version `1.3.9 (21 Jul'22)`

  - NEW   : -shiftX, -shiftY options


Version `1.3.8 (20 Jul'22)`

  - CHANGE: in -command option: resulting text defines the tip's exposition


Version `1.3.7 (1 Jun'22)`

  - CHANGE: baltip::my::Bind*: command can be ended with " ; break"
  - CHANGE: baltip::my::Bind*: "catch" to avoid errors at destroying tipped widgets


Version `1.3.6 (21 Dec'21)`

  - BUGFIX: issue with maximum of exposition, at 1st time


Version `1.3.5 (17 Dec'21)`

  - NEW   : -command option can be changed dynamically, with each tip's exposition


Version `1.3.4 (14 Dec'21)`

  - CHANGE: notebook tips (my::NbkInfo to get/set a notebook tab's data)


Version `1.3.3 (11 Dec'21)`

  - NEW   : baltip::hide can be forced (with "doit" argument)


Version `1.3.2 (8 Dec'21)`

  - NEW   : tips can be disabled for a while ("sleep")