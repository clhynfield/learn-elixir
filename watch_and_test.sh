#!/usr/bin/env sh

function test() {
    rm Elixir.Greetings.beam
    elixirc hello.ex && elixir hello_test.exs
}

function source_has_changed() {
    [[ 'hello.ex' -nt 'Elixir.Greetings.beam' ]] \
    || [[ 'hello_test.exs' -nt 'Elixir.Greetings.beam' ]]
}

while true; do
    if source_has_changed; then test; fi
    sleep .1
done
