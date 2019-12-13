#!/bin/sh
export PERL_CARTON_CPANFILE="$(dirname $0)/cpanfile"
eval 'exec carton exec -- perl -x -S -- $0 "$@"';
#! -*-perl-*-
# line 6
use Mojolicious::Lite;

plugin Config => {
    default => {
        export => {
            pages => ['/'],
            base  => '/',
            to    => './deploy',
        },
    }
};

plugin Yancy => {
    backend => 'static:.',
    read_schema => 1,
    editor => { require_user => undef, },
    schema => {
        pages => {
            'x-id-field' => 'path',
            'x-view-item-url' => '/{path}',
            properties => {
                id => {
                    readOnly => 1,
                },
                author => { type => [ 'string', 'null' ] },
                markdown => {
                    format => 'markdown',
                    'x-html-field' => 'html',
                },
            },
        },
    },
};
get '/*id', {
    controller => 'yancy',
    action => 'get',
    schema => 'pages',
    template => 'default',
    layout => 'default',
    id => 'index',
};
app->start;
__DATA__
@@ default.html.ep
% title $item->{title};
<%== $item->{html} %>
@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
<head>
    <title><%= title %></title>
    <link rel="stylesheet" href="/yancy/bootstrap.css">
</head>
<body>
    <main class="container">
        %= content
    </main>
    <small>by <%= $item->{author} %></small>
    <script src="/yancy/jquery.js"></script>
    <script src="/yancy/bootstrap.js"></script>
</body>
</html>
