requires 'Yancy';

requires 'Mojolicious', '8';
requires 'Mojolicious::Plugin::Yancy', '1.012';
requires 'Mojolicious::Plugin::AutoReload';

on develop => sub {
    requires 'Mojolicious::Command::export';
    requires 'Yancy::Backend::Static', '0.002';
};
