# Redmine Message Issues plugin

This plugin allows to link Issues to a Forum Message. Convenient if the forum is used for support.

If you like this plugin, you're welcome to endorse me!
[![endorse](https://api.coderwall.com/martin-denizet/endorsecount.png)](https://coderwall.com/martin-denizet)

Work sponsored by Algen, visit us at http://algen.co

## Compatibility

Redmine 2.1.x ~ 2.5.x stable

Tested on:
* 2.5.0

## Feature

* Link Issues to a forum Message
* Per project permission

## Screenshots

* [Forum Message](https://raw.github.com/martin-denizet/redmine_message_issues/develop/screenshots/redmine_message_issues_message.png)

## Downloading and installing the plugin

First download the plugin using git, open a terminal in your Redmine installation directory:

```git clone git@github.com:martin-denizet/redmine_message_issues.git ./plugins/```

Then you will need to do migrate the database for the plugin.

``` bundle exec rake redmine:plugins:migrate RAILS_ENV=production```

The installation is now finished and you will be able to use the plugin after you restart your Redmine instance.

## Configuration

* Enable the plugin module in the desired projects settings
* Configure the permissions

## Changelog

* 0.1.1 Cleaner integration of the JavaScript and French translations. Thanks @LeDistordu
* 0.1.0 Initial release

## Credits

* Krzysztof Dryja: Original idea
* Martin Denizet: Development
* LeDistordu: French translations

## License

GPLv2
