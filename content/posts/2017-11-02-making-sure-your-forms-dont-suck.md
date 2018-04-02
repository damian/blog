+++
title = "Making sure your forms don't suck"
date = "2017-11-02"
+++

Last Tuesday I had the privilege of sharing my experiences and thoughts on how to handle clientside validation at this months [JavaScript North East](https://attending.io/events/jsne-october-2017) meetup. It’s a non trivial problem and there are a number of things you have to be aware of before diving in. Most of the open source solutions I’ve worked with in the past I’ve found lacking, the main one being how to complement and reconcile validations performed on the server with those on the client.

Finally I shared how at [Conferize](https://www.conferize.com), we’ve made use of [React](https://reactjs.org/) to build our own clientside validation library. React makes light work of handling internal state and provides a consistent event lifecycle across browsers to overcome these challenges. It's something which we'll hopefully be open sourcing sometime in the near future.

<script async class="speakerdeck-embed" data-id="170937508ba84703ad5b57d0c5fdaab2" data-ratio="1.33333333333333" src="//speakerdeck.com/assets/embed.js"></script>
