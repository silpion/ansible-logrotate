# ansible-logrotate

Configure logrotation.

## Requirements

None.

## Role Variables

* ``logrotate_targets``: Configure log rotation targets and options (dict, default: ``{}``)
* ``logrotate_package_list_state``: Wheter packages are state ``installed`` or ``latest`` (string, default: ``installed``)

### logrotate_targets

``logrotate_targets`` allow to configure logrotation for any number of files per
dictionary key. Each logrotate_targets key supports all options from logrotate
(``man 5 logrotate.conf``) with the ``options`` list.

Generated templates are verified with ``logrotate -d %s`` before they are
copied to the logrotate.d directory.

    logrotate_targets:
      - name: foobar
        files:
          - /var/log/foo/*.log
          - /var/log/bar/*.log
        options:
          - "rotate 7"
          - daily
          - missingok
          - notifempty
          - compress
        ...

Configuring a file name/pattern only results in the following logrotate
configuration:

    logrotate_targets:
      - name: foobar
        files:
          - /var/log/foo/bar*.log

<!-- -->

    /var/log/foo/bar*.log
    {
      rotate 7
      daily
      missingok
      notifempty
      compress
    }

## Dependencies

None.

## Example Playbook

    - hosts: all
      roles:
         - { role: ansible-logrotate }

## License

Apache Version 2.0

## Integration testing

This role provides integration tests using the Ruby RSpec/serverspec framework
with a few drawbacks at the time of writing this documentation.

- Currently supports ansible_os_family == 'Debian' only.

Running integration tests requires a number of dependencies being
installed. As this role uses Ruby RSpec there is the need to have
Ruby with rake and bundler available.

    # install role specific dependencies with bundler
    bundle install

<!-- -->

    # run the complete test suite with Docker
    rake suite

<!-- -->

    # run the complete test suite with Vagrant
    RAKE_ANSIBLE_USE_VAGRANT=1 rake suite


## Author information

Mark Kusch @silpion.de mark.kusch


<!-- vim: set nofen ts=4 sw=4 et: -->
